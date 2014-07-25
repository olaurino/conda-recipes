IRIS=$PREFIX/opt/iris
mkdir -p $IRIS

sed -i 's/-${buildNumber}//g' iris/pom.xml
mvn -DskipTests=true -Dsherpa=no package
cd iris/target
chmod u+x Iris
sed -i 's/startsherpa.py/sherpa-samp/' Iris
sed -i '/python2.6/c\sherpa-samp &>$HOME/.vao/iris/sherpa.log&' Iris
cp Iris $IRIS/launch
cp -r lib $IRIS
cp *.jar $IRIS
cp COPYING $IRIS
cp LICENSE* $IRIS
cp README.txt $IRIS
cp -r examples $IRIS

echo "$PREFIX/opt/iris/launch \$@" > iris
chmod u+x iris
mkdir -p $PREFIX/bin/
cp iris $PREFIX/bin/
