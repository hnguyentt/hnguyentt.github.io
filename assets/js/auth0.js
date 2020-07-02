let auth0 = null;
const fetchAuthConfig = () => fetch("/assets/auth_config.json");
let base_url = "http://localhost:4000"


const configureClient = async () => {
  const response = await fetchAuthConfig();
  const config = await response.json();

  auth0 = await createAuth0Client({
    domain: config.domain,
    client_id: config.clientId
  });
};

const updateUI = async () => {
  const isAuthenticated = await auth0.isAuthenticated();

  document.getElementById("btn-logout").hidden = !isAuthenticated;
  document.getElementById("btn-login").hidden = isAuthenticated;

  if (isAuthenticated) {
//    document.getElementById("gated-content-1").classList.remove("hidden");
//    document.getElementById("gated-content-2").classList.remove("hidden");

    const claims = await auth0.getIdTokenClaims()
    const pictureUrl = claims.picture
    const usrname = claims.name

    document.getElementById("avatar-img").src = pictureUrl || 'https://raw.githubusercontent.com/nguyenhoa93/dataisbeautiful/master/images/logo.png';
    document.getElementById("usr").append(usrname);
    document.getElementById("avatar-img-div").classList.remove("hidden")

  }
};

window.onload = async () => {
  await configureClient();
  updateUI();
  const query = window.location.search;
  if (query.includes("code=") && query.includes("state=")) {
    // Process the login state
    await auth0.handleRedirectCallback();
    updateUI();
    // Use replaceState to redirect the user away and remove the querystring parameters
    window.history.replaceState({}, document.title, window.location.pathname.split("?code=")[0]);
  }
};

const login = async () => {
  await auth0.loginWithRedirect({
    redirect_uri: window.location.href
  });
};

const logout = () => {
  auth0.logout({
    returnTo: window.location.href
  });
};