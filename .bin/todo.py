#! /usr/bin/python

import sys, os, pickle

header = "todo.py: A tool for managing tasks\n==================================\n "

def path():
  pathname = os.path.dirname(sys.argv[0])
  return os.path.abspath(pathname)

taskFile = path()+"/todo-list.pkl"

class Task:
  def __init__(this,name,prio,desc):
    this.name = name
    this.prio = prio
    this.desc = desc

def usage():
  return header+"General Usage: \n  --help: Prints this help message. \n "+addUsage()+" \n "+rmUsage()+" \n "+modUsage()+" \n list - lists all of your tasks in order based on priority. "

def addUsage():
  return "add [title] [priority] [description] - Adds a task to your todo list."

def rmUsage():
  return "rm [task id] - Removes a task from your todo list."

def modUsage():
  return "mod [task id] [priority] - Modifies a task's priority"

def die(func):
  print(func())
  sys.exit(2)

def init(tasks):
  title = sys.argv[0]
  args = sys.argv[1:]
  if len(args) <= 0:
    die(usage)
  if args[0] == "add":
    try:
      name = args[1]
      try: priority = int(args[2])
      except IndexError: priority = 0
      try: description = args[3]
      except IndexError: description = None
      
      task = Task(name,priority,description)
      tasks.append(task)
    except IndexError:
      die(addUsage)
  elif args[0] == "rm":
    try:
      taskID = int(args[1])
    except IndexError:
      die(rmUsage)
    tasks.pop(taskID)
  elif args[0] == "list":
    if len(tasks) > 0:
      for task in range(0,len(tasks)):
        if tasks[task].desc == None: description = ""
        else:                        description = ": "+tasks[task].desc
        print(" -"+str(task)+"- "+tasks[task].name+description+"  ("+str(tasks[task].prio)+")")
    else:
      print("You don't have any todo tasks right now. ")
  elif args[0] == "mod":
    try:
      taskID = int(args[1])
      priority = int(args[2])
      
      tasks[taskID].prio = priority
    except IndexError:
      die(modUsage)
  else:
    die(usage)
  tasks = sorted(tasks, key=lambda t: t.prio)
  return tasks

def buildTasks():
  try: f = open(taskFile,"rb")
  except: return []
  return pickle.load(f)

def saveTasks(data):
  f = open(taskFile,"wb")
  pickle.dump(data, f)

def main ():
  tasks = buildTasks()
  tasks = init(tasks);
  saveTasks(tasks)

if __name__ == "__main__":
  main() 
