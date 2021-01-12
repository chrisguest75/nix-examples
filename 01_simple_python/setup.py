from setuptools import setup

setup(
    name='myapp',
    version='0.1',
    py_modules=['myapp'],
    entry_points={
        'console_scripts': ['myapp = myapp:run']
    },
)
