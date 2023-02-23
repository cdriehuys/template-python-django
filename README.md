# template-python-django

Template for Python projects using Django.

## Using the Template

1. Create your new repository using this one as a template.
2. Replace all references to `template-python-django` and the associated package
   `template_python_django` with your desired package name.
3. Remove this section from `README.md`

## Running Locally

The app can be run locally for the purpose of development or as a standalone
service.

### Development

Open VS Code, and ensure the project is opened as a dev container. This will
bring up the required background services defined in `docker-compose.base.yml`.

To start the server, run:
```bash
cd ./template_python_django
./manage.py runserver
```

The application will be available at http://localhost:8000 assuming no other
service is using that port. See the _PORTS_ tab at the bottom of the VS Code
window for more information.

### Standalone

The entire application stack can be run with `docker compose`:
```bash
docker compose -f ./docker-compose.base.yml -f ./docker-compose.yml up --build
```

The application will be available at http://localhost:8001.

If the VS Code development container is running, then stopping the above command
will also tear down the backing services and the VS Code container. To avoid
this, run only the `app` and `proxy` services:
```bash
docker compose up --build app proxy
```
