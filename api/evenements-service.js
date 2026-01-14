const http = require('http');
const mysql = require('mysql2/promise');
const url = require('url');

const PORT = 3002;
const AUTH_SECRET = 'adminpassword123';

// Config pour se connecter à la DB
const dbConfig = {
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'pousinade',
  port: 3306,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
};

const pool = mysql.createPool(dbConfig);

// Helper pour envoyer les réponses
const sendResponse = (res, statusCode, data) => {
  res.writeHead(statusCode, {
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization'
  });
  res.end(JSON.stringify(data));
};

// Helper pour parser le json
const getRequestBody = (req) => {
  return new Promise((resolve, reject) => {
    let body = '';
    req.on('data', chunk => {
      body += chunk.toString();
    });
    req.on('end', () => {
      try {
        resolve(body ? JSON.parse(body) : {});
      } catch (error) {
        reject(error);
      }
    });
  });
};

// Vérification de l'authentification
const isauthentifiée = (req) => {
  const authHeader = req.headers['authorization'];
  return authHeader === AUTH_SECRET;
};

// LOGIQUE SERVEUR (EVENEMENTS)
const server = http.createServer(async (req, res) => {
  const parsedUrl = url.parse(req.url, true);
  const path = parsedUrl.pathname;
  const method = req.method;

  // CORS
  if (method === 'OPTIONS') {
    res.writeHead(204, {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type, Authorization'
    });
    res.end();
    return;
  }

  try {
    if (path === '/api/evenements') {
      // GET: Lister les evenements (public)
      if (method === 'GET') {
        const [rows] = await pool.query('SELECT * FROM evenement ORDER BY date DESC');
        return sendResponse(res, 200, rows);
      }

      // POST: Créer un event (authentifiée)
      if (method === 'POST') {
        if (!isauthentifiée(req)) return sendResponse(res, 401, { error: 'Unauthorized' });

        const body = await getRequestBody(req);
        const { titre, date, prix, description, animateur } = body;

        const [result] = await pool.query(
          'INSERT INTO evenement (titre, date, prix, description, animateur) VALUES (?, ?, ?, ?, ?)',
          [titre, date, prix, description, animateur]
        );
        return sendResponse(res, 201, { id: result.insertId, message: 'Créé' });
      }
    }

    // 404
    else {
      return sendResponse(res, 404, { error: 'Route not found' });
    }

  } catch (error) {
    console.error(error);
    return sendResponse(res, 500, { error: 'Internal Server Error', details: error.message });
  }
});

// Initialisation de la BDD, avec affichage d'erreurs
async function initializeDatabase() {
  console.log('Connexion à la BDD (Service Evenements)...');
  try {
    const connection = await pool.getConnection();
    console.log('Connexion réussie');
    connection.release();
  } catch (e) {
    console.error(e);
    process.exit(1);
  }
}

// Lancement du serveur
initializeDatabase().then(() => {
  server.listen(PORT, () => {
    console.log(`Evenements Service running at http://localhost:${PORT}`);
    console.log(`DB Host: ${dbConfig.host}`);
  });
});
