# 🌾 Farming Sim (WIP)

A **2D farming simulation game** inspired by *Harvest Moon* and *Stardew Valley*, built in **Godot Engine**. This project is currently in development, with features like **state-based character behavior, tool usage, and movement mechanics** being implemented.

## 🚜 Features (In Progress)

- **State Machine System**  
  - Implemented using **NodeStateMachine** and **NodeState** classes.  
  - Handles transitions between character states (e.g., **Idle, Walking, Chopping**).  

- **Character Control & Animation**  
  - Directional movement based on **input actions**.  
  - Tool interactions (e.g., chopping).  

- **Modular & Scalable Design**  
  - More states and mechanics to be added in future updates.  

## 📝 Key Scripts  

- **NodeStateMachine.gd**  
  - Manages the **current state** and transitions.  
  - Uses a **dictionary** to store state nodes for efficiency.  

- **NodeState.gd**  
  - Abstract base class for **player states**.  
  - Implements methods like `_on_enter()`, `_on_exit()`, and `_on_next_transitions()`.  

- **GameInputEvents.gd**  
  - Handles **movement input** and tool actions.  

## 🎮 Controls  

| Action      | Key (Default) |
|------------|--------------|
| Move Left  | A / Left Arrow |
| Move Right | D / Right Arrow |
| Move Up    | W / Up Arrow |
| Move Down  | S / Down Arrow |
| Use Tool   | Space |

## 🛠️ Future Plans  

✅ More **player states** (e.g., Watering, Hoeing, Planting)  
✅ **Inventory system** for seeds, tools, and crops  
✅ **Day-night cycle & seasonal changes**  
✅ **Farming mechanics** (planting, growing, harvesting)  

## 📌 Notes  

This is a **work in progress**! Follow along for updates as more features are added.

