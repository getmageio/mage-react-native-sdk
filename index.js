import { NativeModules, Platform } from 'react-native'

const { MageReact } = NativeModules
export const Mage = MageReact

// function throwNumericAttributeNameWarning(methodName, attributeName, attribute){
//   methodName = methodName + "(" + attributeName + "," + attribute + ")"
//   console.warn("Mage SDK:", methodName, "called with a numeric variable name:", attributeName, "as a first argument. This is not allowed and the attribut is not passed to the API!")
// }

// function throwAttributeValueWarning(methodName, attributeName, attribute, typeNeeded){
//   methodName = methodName + "(" + attributeName + "," + attribute + ")"
//   console.warn("Mage SDK:", methodName, "called with a non", typeNeeded ,"variable type", typeof(attribute), "as a second argument. This is not allowed and the attribut is not passed to the API!")
// }

// Mage.userPurchased is unavailable and not needed on iOS devices due to our auto tracking purchases feature
if (Platform.OS === 'ios'){
  Mage.userPurchased = () => {}
}