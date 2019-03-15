var component;
var sprite;

function createSpriteObjects(a,x,y,z,w,r) {

    component = Qt.createComponent("Sprite.qml");
    if (component.status === Component.Ready)
        finishCreation(a,x,y,z,w,r);
    else
        component.statusChanged.connect(finishCreation);
}

function finishCreation(a,x,y,z,w,r) {
        console.log(" x position: "+ x + " y position: "+y + " color: "+ z + " w: " + w  + " r: " + r)
    if (component.status === Component.Ready) {
        sprite = component.createObject(a, {"x": x, "y": y,"color": z !== "" ? z : "red","width":w,"height":w,"radius":r});
        if (sprite === null) {
            // Error Handling
            console.log("Error creating object");
        }
    } else if (component.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }
}
