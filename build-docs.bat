@echo off
rdmd --build-only -c -Isource -Dddocs_tmp -X -Xfdocs/docs.json -version=MySQLDocs --force source/mysql/package.d
rmdir /S /Q docs_tmp > NUL 2> NUL
del source\mysql\package.obj

cd .\ddox
dub build
cd ..

.\ddox\ddox -- filter docs/docs.json --min-protection Public
.\ddox\ddox -- generate-html docs/docs.json docs/public --navigation-type=ModuleTree
