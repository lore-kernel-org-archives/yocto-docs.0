Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E40C6FA8E
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 16:52:38 +0000 (UTC)
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by mx.groups.io with SMTP id smtpd.web10.92.1664211156384661034
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 09:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=softfail (domain: gmail.com, ip: 193.142.43.55, mailfrom: alex.kanavin@gmail.com)
From: alex.kanavin@gmail.com
To: yocto@lists.yoctoproject.org,
	docs@lists.yoctoproject.org
Subject: Setting up layers in Yocto, the introduction
Date: Mon, 26 Sep 2022 18:16:57 +0200
Message-Id: <20220926161657.7675-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 Sep 2022 16:52:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3251

TL;DR version
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

If you want to get everything needed to run a yocto build:

- clone the bootstrap repository (ask your distribution maintainer where =
it is):
    $ git clone bootstrap_repo_uri

- run 'setup-layers' from that repo:
    $ /path/to/bootstrap_repo/setup-layers

If you want to save the layers setup for replication elsewhere:

- save the config file and the replication script into a 'bootstrap repos=
itory')
(this can be an organization-specific yocto layer, or a standalone reposi=
tory):
    $ bitbake-layers create-layers-setup /path/to/bootstrap_repo

- document where the bootstrap repository can be found for your users

What is this layer setup tooling? (the long version)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

Once you have a working build with the correct set of layers, it is benef=
icial
to capture the layer setup --- what they are, which repositories they com=
e from
and which SCM revisions they're at --- into a configuration file, so that=
 this
setup can be easily replicated later, perhaps on a different machine. Her=
e's
how to do this::

   $ bitbake-layers create-layers-setup /srv/work/alex/meta-alex/
   NOTE: Starting bitbake server...
   NOTE: Created /srv/work/alex/meta-alex/setup-layers.json
   NOTE: Created /srv/work/alex/meta-alex/setup-layers

The tool needs a single argument which tells where to place the output, c=
onsisting
of a json formatted layer configuration, and a ``setup-layers`` script th=
at can use that configuration
to restore the layers in a different location, or on a different host mac=
hine. The argument
can point to a custom layer (which is then deemed a "bootstrap" layer tha=
t needs to be
checked out first), or into a completely independent location.

The replication of the layers is performed by running the ``setup-layers`=
` script provided
above:

1. Clone the bootstrap layer or some other repository to obtain
   the json config and the setup script that can use it.

2. Run the script directly with no options::

      alex@Zen2:/srv/work/alex/my-build$ meta-alex/setup-layers
      Note: not checking out source meta-alex, use --force-bootstraplayer=
-checkout to override.

      Setting up source meta-intel, revision 15.0-hardknott-3.3-310-g0a96=
edae, branch master
      Running 'git init -q /srv/work/alex/my-build/meta-intel'
      Running 'git remote remove origin > /dev/null 2>&1; git remote add =
origin git://git.yoctoproject.org/meta-intel' in /srv/work/alex/my-build/=
meta-intel
      Running 'git fetch -q origin || true' in /srv/work/alex/my-build/me=
ta-intel
      Running 'git checkout -q 0a96edae609a3f48befac36af82cf1eed6786b4a' =
in /srv/work/alex/my-build/meta-intel

      Setting up source poky, revision 4.1_M1-372-g55483d28f2, branch aka=
navin/setup-layers
      Running 'git init -q /srv/work/alex/my-build/poky'
      Running 'git remote remove origin > /dev/null 2>&1; git remote add =
origin git://git.yoctoproject.org/poky' in /srv/work/alex/my-build/poky
      Running 'git fetch -q origin || true' in /srv/work/alex/my-build/po=
ky
      Running 'git remote remove poky-contrib > /dev/null 2>&1; git remot=
e add poky-contrib ssh://git@push.yoctoproject.org/poky-contrib' in /srv/=
work/alex/my-build/poky
      Running 'git fetch -q poky-contrib || true' in /srv/work/alex/my-bu=
ild/poky
      Running 'git checkout -q 11db0390b02acac1324e0f827beb0e2e3d0d1d63' =
in /srv/work/alex/my-build/poky

.. note::

   This will work to update an existing checkout as well.

.. note::
   The script is self-sufficient and requires only python3
   and git on the build machine.

.. note::
   Both the ``create-layers-setup`` and the ``setup-layers`` provided sev=
eral additional options
   that customize their behavior - you are welcome to study them via ``--=
help`` command line parameter.

Questions and answers
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

1. Why JSON, and not YAML?

JSON is a part of the python standard library, while YAML is not. This me=
ans you can bootstrap a build on just about any
machine that has python and its core library, without first having to ins=
tall any dependencies. JSON not quite as easy
on the eye, but with decent indentation it's totally ok.

Before anyone asks, XML is appallingly difficult to read by modern standa=
rds of readability. No thanks.

2. I don't want the script in the bootstrap repo, just the config. I will=
 provide my own tools. How?

Use --json-only to generate only the config, and not the script:

    $ bitbake-layers create-layers-setup -json-only /srv/work/alex/meta-a=
lex/

3. I want to generate the compatible json with my own tools. Is there a s=
chema to validate it?

There is:
https://git.yoctoproject.org/poky/tree/meta/files/layers.schema.json

You can use python3-jsonschema package to check the validity.

4. I don't want the json or the script, and would want to use an entirely=
 different format and tools. Is
'create-layers-setup' hardcoded to the OE json format?

Actually not! Other formats can be added through a plugin mechanism. OE j=
son writer is just
the default plugin but others can be implemented and selected:

    --writer {oe-setup-layers}, -w {oe-setup-layers}
                        Choose the output format (defaults to oe-setup-la=
yers).

5. I want to use something else than hardcoded revisions in the json (e.g=
. refer to branch
names or tags).

No problem! Edit the json to say 'main' or 'release-x.y'. Anything that '=
git checkout' can take will
work. Just be careful that these modification are not overwritten later b=
y 'create-layers-setup' by
e.g. renaming the json file first.

6. I already have an existing checkout and want to update it to the lates=
t greatest. How?

First, update the bootstrap repository to the latest (or otherwise desire=
d) revision to
obtain the latest versions of the script, and the json config. Ask the di=
stro maintainers
for the recommended practice to do so.

Then, run the script again - it should be able to handle a layers checkou=
t that already
exists, and update everything accoriding to the latest json, obtained in =
the first step.

7. Ok, I have checked out all the layers. Now what?

The next step is to actually set up a yocto build from an existing config=
uration template,
and start a bitbake session. This is made separate from handling the laye=
r repositories and
will be described separately.

