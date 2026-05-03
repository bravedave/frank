# How I AI

Not claiming the original idea — just making it work for me.

There’s a podcast called *How I AI*. I like the phrase and the PodCast — it’s memorable — but I’m not part of that and this isn’t a reference to it. This is simply how *I* use AI in my own development environment.

I’m a coder. PHP, Composer. I like Symfony and Laravel, but I prefer my own framework—it suits how I think. I work in VS Code with GitHub Copilot.

For me, AI works best when it’s treated like a country. Countries function because they have **rules**, **direction**, and **controlled change**.

So my model is simple:

**Constitution · Governance · Change**

## AI Land

Every useful AI setup needs three things:

* **The Constitution**
  The non-negotiable rules. What cannot be broken.

* **Governance (Intent)**
  How those rules are applied. Governance must respect the constitution.

* **Change**
  The specific improvement you want to make—always intentional, always scoped.

Without all three, AI becomes noisy, inconsistent, or actively harmful.

## Real AI (VS Code / Copilot Land)

In practice, this maps very cleanly to files:

* **Constitution** → `.github/copilot-instructions.md`
* **Governance / Intent** → `README.md`
* **Change** → `delta.md`

This gives the model boundaries, context, and a clear task. No guessing. No vibes.

## A Word About Models

VS Code gives you options, and that matters.

* **Claude** is the default for a reason—it’s excellent for structure and correctness. Downsides: premium usage and weaker performance on large memory-heavy tasks.
* **Raptor Mini** is fast and cheap, but needs more coaching.
* **GPT-5-mini** sits somewhere in between.

There’s no “best” model. Pick based on cost, speed, and how much correction you’re willing to do.

## Action

Enough theory. Let’s do something.

### 1. Create a container

```bash
# Clone the repository
git clone https://github.com/bravedave/frank your-project-name
cd your-project-name

# Remove git history
rm -rf .git

# Setup the environment
./setup-environment.sh

# Start the container
docker compose up -d --build
```

Docker still feels like cheating. Dev environment: done.

### 2. Connect with VS Code

I use Microsoft’s extensions:

* Remote Explorer
* Container Tools
* GitHub Copilot
* GitHub Copilot Chat

I’m on the smallest GitHub subscription. There *is* a free tier, but you’ll need a paid plan for Claude.

### 3. Observe the setup

>#### Tip
>
>* open the container in VS Code (requires the extentions above)
>* and switch to the folder `/app`

Inside the container you’ll find:

1. `delta.md`
2. `public/index.php`, available at
   `http://localhost:8180`

### 4. Execute the change

This is the workflow:

1. Open the Copilot Chat panel
2. Open `delta.md` in the editor
3. Select everything in `delta.md`
4. In chat, type: **execute this delta change**

Then let it run.

Sometimes I approve commands one by one. Sometimes I let it rip.

* **Claude** built my TODO app with 100% accuracy.
* **Raptor Mini** was faster, but missed things and needed correction.

## Summary

AI works when it has boundaries.

When I AI, I always establish:

* **Constitution** – hard rules
* **Governance** – intent and direction
* **Change** – a clear, scoped improvement

Inside that framework, AI stops being a toy and starts being a serious tool.

That’s how I AI.
