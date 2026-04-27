Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E96C0FF8868
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 14:43:46 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46963.1777301022433110606
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 07:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HEC9GkN6;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9EAACC5CD4A
	for <docs@lists.yoctoproject.org>; Mon, 27 Apr 2026 14:44:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6EDE9600D1;
	Mon, 27 Apr 2026 14:43:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EAD0E10728201;
	Mon, 27 Apr 2026 16:43:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777301020; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0ra9mtGU3+tWTHWljAPY8jDFAPJOwO3ei0pH0k37rB0=;
	b=HEC9GkN6tb9+lenvdAxUlTDq4kW/LYs7MvVacpdfwq97UcJrwOHESc4sRasiN4GZMGb0IG
	lj5B8KCXTk7Q3efuEPpcAa6CYeRS0r5BE4wYqOG4mG7ZNf7U2ss9gDJnI4bcGa85bzm7db
	0+uBGALY8SYH39v0Pacu1BEYw8iBUmDpIVhzOyXE/rrCYUWgDSwJgFS2P1qb6xT9Gpuncf
	L0+tVq5AWHtSeFbu/jXL9OlFX5bVHriSmBMphPm6S0vndOasa8QjU7WWmk7SjYSiYyVlYu
	Y7wJPIgmeSM2qYZCDtgyjDnv+udenTsiQ3pb3Amwuv0Nufq8t5e9eZ7Nt9/x5w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Apr 2026 16:43:38 +0200
Message-Id: <DI40MO4BDL1R.306ON3EYMK35F@bootlin.com>
Subject: Re: [docs] [PATCH v2] Document shared state signing
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
References: <20260421-sstate-signing-v2-1-7b572121f2fd@bootlin.com>
 <a4723996-6d07-41b1-a40b-35e12e48807f@cherry.de>
In-Reply-To: <a4723996-6d07-41b1-a40b-35e12e48807f@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Apr 2026 14:43:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9372

Hi,

On Fri Apr 24, 2026 at 5:18 PM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Antonin,
>
> On 4/21/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Document the shared state signing feature. Add a new document in the
>> Security manual, and definitions for the variables involved in this
>> process in the variable glossary.
>>=20
>> [YOCTO #15217]
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>> Changes in v2:
>> - Fix typos reported by Ulrich (thanks!)
>> - Link to v1: https://patch.msgid.link/20260417-sstate-signing-v1-1-5df1=
1613249e@bootlin.com
>> ---
>>   documentation/overview-manual/concepts.rst       |   6 +
>>   documentation/ref-manual/variables.rst           |  50 +++++
>>   documentation/security-manual/index.rst          |   1 +
>>   documentation/security-manual/sstate-signing.rst | 272 +++++++++++++++=
++++++++
>>   4 files changed, 329 insertions(+)
>>=20
>> diff --git a/documentation/overview-manual/concepts.rst b/documentation/=
overview-manual/concepts.rst
>> index ab723d7c3..f0b336226 100644
>> --- a/documentation/overview-manual/concepts.rst
>> +++ b/documentation/overview-manual/concepts.rst
>> @@ -1240,6 +1240,12 @@ variable is the function that determines whether =
a given dependency
>>   needs to be followed, and whether for any given relationship the
>>   function needs to be passed. The function returns a True or False valu=
e.
>>  =20
>> +.. note::
>> +
>> +   Is is possible to sign these artifacts with :wikipedia:`GPG
>> +   <GNU_Privacy_Guard>`. See :doc:`/security-manual/sstate-signing` in =
the Yocto
>> +   Project Security Manual for more information.
>> +
>>   Images
>>   ------
>>  =20
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-=
manual/variables.rst
>> index 317b75913..90d7fc924 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -10097,6 +10097,25 @@ system and gives an overview of their function =
and contents.
>>  =20
>>         For details on the process, see the :ref:`ref-classes-staging` c=
lass.
>>  =20
>> +   :term:`SSTATE_SIG_KEY`
>> +      When signing :ref:`shared state <overview-manual/concepts:setscen=
e tasks
>> +      and shared state>` artifacts (when :term:`SSTATE_VERIFY_SIG` is s=
et to
>> +      "1"), the :term:`SSTATE_SIG_KEY` variable is the :wikipedia:`GPG
>> +      <GNU_Privacy_Guard>` key identifier used to sign them (with the p=
rivate
>> +      key).
>> +
>> +      See :doc:`/security-manual/sstate-signing` in the Yocto Project S=
ecurity
>> +      Manual for more information.
>> +
>> +   :term:`SSTATE_SIG_PASSPHRASE`
>> +      When signing :ref:`shared state <overview-manual/concepts:setscen=
e tasks
>> +      and shared state>` artifacts (when :term:`SSTATE_VERIFY_SIG` is s=
et to
>> +      "1"), the :term:`SSTATE_SIG_PASSPHRASE` variable is the passphras=
e used to
>> +      protect the private key signing the artifacts.
>> +
>> +      See :doc:`/security-manual/sstate-signing` in the Yocto Project S=
ecurity
>> +      Manual for more information.
>> +
>>      :term:`SSTATE_SKIP_CREATION`
>>         The :term:`SSTATE_SKIP_CREATION` variable can be used to skip th=
e
>>         creation of :ref:`shared state <overview-manual/concepts:shared =
state cache>`
>> @@ -10117,6 +10136,37 @@ system and gives an overview of their function =
and contents.
>>  =20
>>            SSTATE_SKIP_CREATION =3D "1"
>>  =20
>> +   :term:`SSTATE_VALID_SIGS`
>> +      When verifying :ref:`shared state <overview-manual/concepts:setsc=
ene tasks
>> +      and shared state>` artifacts (when :term:`SSTATE_VERIFY_SIG` is s=
et to
>> +      "1"), the :term:`SSTATE_VALID_SIGS` variable is a space-separated=
 list of
>> +      :wikipedia:`GPG <GNU_Privacy_Guard>` key identifiers to use to ve=
rify their
>> +      signature.
>> +
>> +      It must contain the short form identifier of the key pair. For ex=
ample,
>> +      when running the ``gpg --list-keys`` command:
>> +
>> +      .. parsed-literal::
>> +
>
> You could use
>
> .. code-block:: console
>
>     $ gpg --list-keys
>     pub....
>
> to avoid having to use a literal include.

This use of parsed-literal was intended, as it shows the last 16 characters=
 in
bold. I'll add " (in bold text below)" before the colon.

>> +         pub   ed25519 2026-04-17 [SC]
>> +               \4049A47E3AAA99D0250966DC\ **5B97632FA7F4E942**
>> +         uid           [ultimate] Antonin Godard (SState Signing) <anto=
nin.godard\@bootlin.com>
>> +         sub   cv25519 2026-04-17 [E]
>> +
>> +      The short form equals the last 16 characters of the identier. In =
the above
>
> s/identier/identifier/
>
>> +      example: ``5B97632FA7F4E942``.
>> +
>> +      See :doc:`/security-manual/sstate-signing` in the Yocto Project S=
ecurity
>> +      Manual for more information.
>> +
>> +   :term:`SSTATE_VERIFY_SIG`
>> +      The :term:`SSTATE_VERIFY_SIG` variable controls whether to enable=
 or
>> +      disable the :ref:`shared state <overview-manual/concepts:setscene=
 tasks
>> +      and shared state>` artifacts signing feature.
>> +
>> +      See :doc:`/security-manual/sstate-signing` in the Yocto Project S=
ecurity
>> +      Manual for more information.
>> +
>>      :term:`STAGING_BASE_LIBDIR_NATIVE`
>>         Specifies the path to the ``/lib`` subdirectory of the sysroot
>>         directory for the build host.
>> diff --git a/documentation/security-manual/index.rst b/documentation/sec=
urity-manual/index.rst
>> index 3453940f5..a767cd9c6 100644
>> --- a/documentation/security-manual/index.rst
>> +++ b/documentation/security-manual/index.rst
>> @@ -14,6 +14,7 @@ Yocto Project Security Manual
>>      securing-images
>>      vulnerabilities
>>      read-only-rootfs
>> +   sstate-signing
>>  =20
>>   .. include:: /boilerplate.rst
>>  =20
>> diff --git a/documentation/security-manual/sstate-signing.rst b/document=
ation/security-manual/sstate-signing.rst
>> new file mode 100644
>> index 000000000..54ae92d50
>> --- /dev/null
>> +++ b/documentation/security-manual/sstate-signing.rst
>> @@ -0,0 +1,272 @@
>> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
>> +
>> +Shared State Signing
>> +********************
>> +
>> +The :term:`OpenEmbedded Build System` build system has a built-in mecha=
nism
>> +allowing to save execution time by re-using pre-built artifacts: the
>> +:ref:`shared state cache (sstate cache) <overview-manual/concepts:share=
d state
>> +cache>`. These artifacts are stored in a directory (:term:`SSTATE_DIR`)=
 and are
>> +not signed by default.
>> +
>> +This document goes through the steps to enable shared state signing.
>> +This feature is fully dependent on :wikipedia:`GPG <GNU_Privacy_Guard>`=
, meaning
>> +examples shown in this document will use the ``gpg`` command-line tool.
>> +
>> +Host Requirements
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +As :wikipedia:`GPG <GNU_Privacy_Guard>` is not part of the default :ref=
:`host
>> +requirements <ref-manual/system-requirements:Required Packages for the =
Build
>> +Host>`, you will need to install it on your host.
>> +
>> +For example, Debian based distributions provide it with the `gpg` packa=
ge name.
>
> Double tick around gpg maybe?
>
>> +Install it as follows:
>> +
>> +.. code-block:: console
>> +
>> +   $ sudo apt install gpg
>> +
>
> apt-get
>
> :D
>
>> +Verify that your installation is successful by showing the version of G=
PG:
>> +
>> +.. code-block:: console
>> +
>> +   $ gpg --version
>> +
>
> What exactly does this depend on? Only the gpg binary or also libraries?=
=20
> It'd be nice to know because maybe other distros have different packages=
=20
> and need more/less. It seems that Debian's package installs the binary=20
> and depends on libgpg-error0 library.
>
> Can be figured out later but it'd be nice.

This: https://pkgs.org/search/?q=3D%2Fusr%2Fbin%2Fgpg
tells me that you probably only need to install a single package to get the
``gpg`` command-line tool. However I'm not sure if there are other requirem=
ents,
but I don't think this document should go in length about it

>> +Generating A Public And Private Key Pair With GPG
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>> +
>> +.. note::
>> +
>> +   This step is optional if you already have a pair of public and priva=
te keys.
>> +
>> +We need a pair of public and private keys for two independent tasks:
>> +
>> +-  Signing our sstate artifacts that the :term:`OpenEmbedded Build Syst=
em`
>> +   generates with our **private key**.
>> +
>> +-  Verifying our sstate artifacts with our **public key** when re-using=
 them.
>> +
>
> You alternate between "we/us/our" and "you" and the use of the=20
> imperative mood ("Do this") throughout the document, it's a bit=20
> confusing. I think we've mostly use the second person and imperative=20
> mood so far, so maybe stick to that?
>
> You also alternate between "sstate" and "shared state".

I've harmonized the doc in v3, thanks

>> +.. note::
>> +
>> +   For more information on public key cryptography, see
>> +   :wikipedia:`Public-key_cryptography`.
>> +
>> +With the ``gpg`` command-line tool, generate a new pair of public and p=
rivate
>> +keys:
>> +
>> +.. code-block:: console
>> +
>> +   $ gpg --full-generate-key
>> +
>> +This will guide you through the steps of creating the key pair.
>> +
>
> s/This/It/
>
> I initially was being confused why there was no step after "This will=20
> guide you" that would actually guide me through the steps :)
>
>> +Once done, you should be able to list your new key with the following c=
ommand:
>> +
>> +.. code-block:: console
>> +
>> +   $ gpg --list-keys
>> +   pub   ed25519 2026-04-17 [SC]
>> +         4049A47E3AAA99D0250966DC5B97632FA7F4E942
>> +   uid           [ultimate] Antonin Godard (SState Signing) <antonin.go=
dard@bootlin.com>
>> +   sub   cv25519 2026-04-17 [E]
>> +
>> +In the above example, take note of the
>> +``4049A47E3AAA99D0250966DC5B97632FA7F4E942`` key identifier. This will =
be used
>> +to configure our build.
>> +
>> +Configuring Our Build System To Sign Sstate Artifacts
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>> +
>> +Shared State Location
>> +---------------------
>> +
>> +Our build system needs to be configured to sign new sstate artifacts wh=
en they
>> +are generated. The generation of new artifacts is done once a task has =
finished
>> +being executed.
>> +
>> +For the following sections let's assume that our build system has the s=
hared
>> +state directory location (:term:`SSTATE_DIR`) defined as follows::
>> +
>> +   SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
>> +
>> +Assuming this directory and our temporary directory (:term:`TMPDIR`) ar=
e empty,
>> +as an example throughout this document, let's run the ``create_recipe_s=
pdx``
>
> What part of the sentence does "as an example throughout this document"=
=20
> apply to? The wording is awkward.
>
>> +task of the ``gettext-minimal-native`` recipe:
>> +
>> +.. code-block:: console
>> +
>> +   $ bitbake gettext-minimal-native -c create_recipe_spdx
>> +
>> +After execution, our shared state directory should be populated with ne=
w files:
>> +
>> +.. code-block:: console
>> +
>> +   $ find $BUILDDIR/sstate-cache/ -name "*gettext-minimal-native*create=
_recipe_spdx*"
>> +   sstate-cache/universal/a3/6e/sstate:gettext-minimal-native:x86_64-li=
nux:1.0:r0:x86_64:14:a36ef66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf497=
8b2b3b617a_create_recipe_spdx.tar.zst
>> +   sstate-cache/universal/a3/6e/sstate:gettext-minimal-native:x86_64-li=
nux:1.0:r0:x86_64:14:a36ef66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf497=
8b2b3b617a_create_recipe_spdx.tar.zst.siginfo
>> +
>> +These are the default shared state artifacts generated by the
>> +:term:`OpenEmbedded Build System`. They are not signed with GPG by defa=
ult, so
>> +let's see how to add signing of these artifacts.
>> +
>> +.. note::
>> +
>> +   The `siginfo` file is not related to GPG signing.
>> +
>
> But the first file also not since we haven't enabled signing yet, what=20
> did you want to say here?

Avoid confusion as "siginfo" could make someone think of "signatures" and h=
ence
signing/gpg. Is adding the note more confusing?

>
>> +Enabling Shared State Signing
>> +-----------------------------
>> +
>> +Create a new :term:`configuration file` on your host **in a safe locati=
on** and
>
> What makes a location safe?

> I would suggest to put it somewhere in $HOME/.config/ maybe?

Maybe, but I don't think that makes it safer?

> Since it contains a secret, we should probably also recommend to do
>
> chmod o-rwx <file>

Yes, I'll add that.

> no (and possibly chown $USER:$USER <file> ?)

This should be the default when creating the file but I can add that.

>> +add the two following statements::
>> +
>> +   SSTATE_VERIFY_SIG =3D "1"
>> +   SSTATE_SIG_KEY =3D "80613045069236143C2EE1A3C8855DA51F042B42"
>> +   SSTATE_SIG_PASSPHRASE =3D "3lvJGHo8HZIcaufWFRezFIYRFDMSDmmkxOiwQ67Pe=
M8IZre90I"
>> +
>
> Those (the key and the passphrase) don't match anything in this file,=20
> it'd be best to reuse what you've highlighted in the previous section.
>
> For the passphrase, maybe mention to "for example use that passphrase"=20
> when generating the key (and adding a big fat warning to not actually=20
> use that passphrase), so we know this here refers to that there. Just a=
=20
> suggestion, maybe it's easier to not give an example than having to=20
> remind people not to reuse it.
>
>> +It is advised to put these statements in a separate file as those conta=
in
>> +secrets and should not be shared. For this example, let's assume this f=
ile is
>> +``conf/sstate-sig-key.conf``.
>> +
>> +These statements define:
>> +
>> +-  :term:`SSTATE_VERIFY_SIG`: setting this variable to "1" enables the =
shared
>> +   state signing feature.
>> +
>> +-  :term:`SSTATE_SIG_KEY`: the GPG key identifier for signing shared st=
ate
>> +   artifacts with the private key.
>> +
>> +   In our example, this corresponds to the identifier printed with the =
``gpg
>> +   --list-keys`` command :ref:`above <security-manual/sstate-signing:Ge=
nerating
>> +   A Public And Private Key Pair With GPG>`.
>> +
>> +-  :term:`SSTATE_SIG_PASSPHRASE`: the passphrase used to protect your p=
rivate
>> +   key when creating the key, chosen when creating the key pair.
>> +
>
> Am I the only bothered this is an option? Is there no way to use a=20
> keyring or the gpg-agent instead?

I don't think so, no.

>> +Let's test our configuration:
>> +
>> +#. Continuing with our ``gettext-minimal-native`` example, let's first =
clean the
>> +   existing shared state artifacts:
>> +
>> +   .. code-block:: console
>> +
>> +      $ bitbake gettext-minimal-native -c cleansstate
>> +
>
> Why do we need to clean the cache (I'm assuming because you want to make=
=20
> sure the artifacts you sign are the one you just generated and not=20
> malicious ones, but I think it'd be worth explaining this is not a=20
> limitation but a design decision (IFF I really guessed that right)).

I'm giving an example here, and want to make sure my share state artifacts =
are
re-generated.

>> +#. Run the ``create_recipe_spdx`` task for ``gettext-minimal-native``, =
but this
>> +   time pass our new ``sstate-sig-key.conf`` file to :term:`BitBake`:
>> +
>> +   .. code-block:: console
>> +
>> +      $ bitbake -R conf/sstate-sig-key.conf gettext-minimal-native -c c=
reate_recipe_spdx
>> +
>> +List the files in the shared state directory again:
>> +
>> +.. code-block:: console
>> +
>> +   $ find sstate-cache/ -name "*gettext-minimal-native*create_recipe_sp=
dx*"
>> +   sstate-cache/universal/a3/6e/sstate:gettext-minimal-native:x86_64-li=
nux:1.0:r0:x86_64:14:a36ef66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf497=
8b2b3b617a_create_recipe_spdx.tar.zst
>> +   sstate-cache/universal/a3/6e/sstate:gettext-minimal-native:x86_64-li=
nux:1.0:r0:x86_64:14:a36ef66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf497=
8b2b3b617a_create_recipe_spdx.tar.zst.sig
>> +   sstate-cache/universal/a3/6e/sstate:gettext-minimal-native:x86_64-li=
nux:1.0:r0:x86_64:14:a36ef66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf497=
8b2b3b617a_create_recipe_spdx.tar.zst.siginfo
>> +
>> +A new ``.sig`` file was created: this means our artifact was successful=
ly
>> +signed, and the signature is stored in a separate ``.sig`` file.
>> +
>> +Verifying Signed Shared State Artifacts
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Now that we have set up our build to sign shared state artifacts, let's=
 see how
>> +we can verify them with the public key counterpart of the private key.
>> +
>> +.. note::
>> +
>> +   Signature of shared state and its verification can happen on two dif=
ferent
>> +   hosts, meaning one host can be in charge of the signature while anot=
her only
>> +   verifies the artifacts. This is preferred as the private key should =
not be
>> +   shared spread on multiple hosts.
>> +
>
> s/spread on/between/
>
>> +From a :term:`configuration file` such as the :ref:`site configuration =
file
>> +<structure-build-conf-site.conf>`, include the following statements::
>> +
>> +   SSTATE_VERIFY_SIG =3D "1"
>> +   SSTATE_VALID_SIGS =3D "5B97632FA7F4E942"
>> +
>> +These statements define:
>> +
>> +-  :term:`SSTATE_VERIFY_SIG`: setting this variable to "1" enables the =
shared
>> +   state signing feature.
>> +
>> +-  :term:`SSTATE_VALID_SIGS`: a space-separated list of key identifiers=
 for
>> +   which we can accept shared state artifacts.
>> +
>> +   This means that shared state will be reused **only if it was signed =
with the
>> +   private key corresponding to key identifier**.
>> +
>> +   You'll notice the short-form of the key identifier here, which are t=
he last 16
>> +   characters of the long-form key identifier shown with ``gpg --list-k=
eys``:
>> +
>> +   .. parsed-literal::
>> +
>> +      pub   ed25519 2026-04-17 [SC]
>> +            \4049A47E3AAA99D0250966DC\ **5B97632FA7F4E942**
>> +      uid           [ultimate] Antonin Godard (SState Signing) <antonin=
.godard\@bootlin.com>
>> +      sub   cv25519 2026-04-17 [E]
>> +
>
> See comment in the first occurrence of this parsed-literal.
>
>> +Let's verify that signature verification works:
>> +
>> +#. First, remove temporary outputs (:term:`TMPDIR`) from the previous b=
uilds, to
>> +   make the :term:`OpenEmbedded Build System` use the shared state:
>
> make <OE> rebuild everything using the shared state
>
> ?
>
>> +
>> +   .. code-block:: console
>> +
>> +      $ rm -r $BUILDDIR/tmp/
>> +
>
> You never tell the user what this variable should be set to. If they=20
> forget, they'll wreak havoc on their host system deleting /tmp/ recursive=
ly.

I'll remove BUILDDIR

>> +#. Then, run the task again:
>> +
>> +   .. code-block:: console
>> +
>> +      $ bitbake gettext-minimal-native -c create_recipe_spdx
>> +
>> +#. To make sure the shared state artifact was successfully used, look f=
or the
>> +   :ref:`setscene <overview-manual/concepts:setscene tasks and shared s=
tate>` task
>> +   for ``create_recipe_spdx`` in the latest log file from :term:`BitBak=
e`:
>> +
>> +   .. code-block:: console
>> +
>> +      $ grep create_recipe_spdx_setscene tmp/log/cooker/<machine>/conso=
le-latest.log
>> +      NOTE: Running setscene task 1 of 1 (../layers/openembedded-core/m=
eta/recipes-core/gettext/gettext-minimal-native_1.0.bb:do_create_recipe_spd=
x_setscene)
>> +      NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_recipe=
_spdx_setscene: Started
>> +      NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_recipe=
_spdx_setscene: Succeeded
>> +
>> +   Our shared state was successfully verified and used!
>
> Is there any indication in the logs that verification was actually=20
> performed?

No, I didn't find any in the code, or with any verbosity level

>> +
>> +.. note::
>> +
>> +   To make sure shared state verification is working, you can set a "fa=
ke"
>> +   public key identifier in :term:`SSTATE_VALID_SIGS`::
>> +
>> +      SSTATE_VALID_SIGS =3D "CAFECAFECAFECAFE"
>> +
>> +   Remove the temporary outputs again:
>> +
>> +   .. code-block:: console
>> +
>> +      $ rm -r $BUILDDIR/tmp/
>> +
>> +   Now, try executing the task:
>> +
>> +   .. code-block:: console
>> +
>> +      $ bitbake gettext-minimal-native -c create_recipe_spdx
>> +
>> +   You should have warnings from :term:`BitBake`:
>> +
>
> Is this output in the console or in the log file you mentioned earlier?

In the console. I'll mention it

>> +   .. code-block:: text
>> +
>> +      WARNING: gettext-minimal-native-1.0-r0 do_create_recipe_spdx_sets=
cene: No accepted signatures found. Good signatures found: 5B97632FA7F4E942=
.
>> +      WARNING: gettext-minimal-native-1.0-r0 do_create_recipe_spdx_sets=
cene: Cannot verify signature on sstate package ../build/sstate-cache/unive=
rsal/a3/6e/sstate:gettext-minimal-native:x86_64-linux:1.0:r0:x86_64:14:a36e=
f66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf4978b2b3b617a_create_recipe_=
spdx.tar.zst, skipping acceleration...
>> +      WARNING: gettext-minimal-native-1.0-r0 do_create_recipe_spdx_sets=
cene: No sstate archive obtainable, will run full task instead.
>> +      WARNING: Logfile for failed setscene task is ../build/tmp/work/x8=
6_64-linux/gettext-minimal-native/1.0/temp/log.do_create_recipe_spdx_setsce=
ne.6994
>> +      WARNING: Setscene task (../layers/openembedded-core/meta/recipes-=
core/gettext/gettext-minimal-native_1.0.bb:do_create_recipe_spdx_setscene) =
failed with exit code '1' - real task will be run instead
>> +
>> +   As you can see, this does not prevent :term:`BitBake` from continuin=
g, but
>> +   the real task is executed instead of re-using the shared state.
>>=20

Thanks!
Antonin

