# Simple Python Example

Demonstrates how to build a simple python flask app in Nix  

## 🏠 Steps

Enter the `01_simple_python` folder.  

This is really cool as it could be a way of building python apps to distribute.  

NOTE: You can run this from the playground.  

```sh
# build the package
nix-build

# enter the nix shell for python application
nix-shell default.nix

# run an application
python3 myapp.py & 

# ping endpoint
curl 0.0.0.0:5000
```

## Resources
