Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17011CD5BC8
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 08:17:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32595.1779783413332947089
 for <docs@lists.yoctoproject.org>;
 Tue, 26 May 2026 01:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QZrwXHjT;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5E4354E42D0E
	for <docs@lists.yoctoproject.org>; Tue, 26 May 2026 08:16:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D8F560732;
	Tue, 26 May 2026 08:16:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A572910888345;
	Tue, 26 May 2026 10:16:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779783410; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Oumrc7V5JBYWAIplNsGLTVCSevbI7Lbj0kzGd9n3Hd8=;
	b=QZrwXHjTHQowlz5u/VPuvS4+tpfkG1oyZghhiCfTriZrIP4dbu6cOFXOlNOKpquuLDs6A8
	DRYwXTyo1AKu57z7MjKhP8fGIWaekXJHZRa0o3gv+QJdwzB2fnWPRCyr0tukgRujm/Xk0s
	rDlHnAJrUcey9knq0ys6s1T9ASl4qIgxZELTzei/Y+hJzX653lzJCMc4TbYycPF3HLoj/R
	7ZJSWCNR/EY8xAe7LkPA07TQTCjQ0si/vrscBdKpHTa4qAlsGptEhr8o92Bg/NyW2VHA1p
	VTPxOCzIOg2xJApNLFslOfoyda5Vjw9dR5pUd7XeSEa3VODI72Fl0ckjgS17yA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 May 2026 10:16:48 +0200
Message-Id: <DISGKANP7F02.XXW0GQUSJK9G@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v3] Document shared state signing
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
References: <20260428-sstate-signing-v3-1-52cc8177b4ff@bootlin.com>
 <e5ac74f3-0b61-4e30-bbf4-0b9aeb725e94@cherry.de>
In-Reply-To: <e5ac74f3-0b61-4e30-bbf4-0b9aeb725e94@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 26 May 2026 08:17:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9537

Hi,

On Thu May 7, 2026 at 11:49 AM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Antonin,
>
> On 4/28/26 10:28 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Document the shared state signing feature. Add a new document in the
>> Security manual, and definitions for the variables involved in this
>> process in the variable glossary.
>>=20
>> [YOCTO #15217]
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>> Changes in v3:
>> - Rework after Quentin's suggestions (thanks!)
>> - Link to v2: https://patch.msgid.link/20260421-sstate-signing-v2-1-7b57=
2121f2fd@bootlin.com
>>=20
>> Changes in v2:
>> - Fix typos reported by Ulrich (thanks!)
>> - Link to v1: https://patch.msgid.link/20260417-sstate-signing-v1-1-5df1=
1613249e@bootlin.com
>> ---
>>   documentation/overview-manual/concepts.rst       |   6 +
>>   documentation/ref-manual/variables.rst           |  57 +++++
>>   documentation/security-manual/index.rst          |   1 +
>>   documentation/security-manual/sstate-signing.rst | 285 +++++++++++++++=
++++++++
>>   4 files changed, 349 insertions(+)
>>=20
>> diff --git a/documentation/overview-manual/concepts.rst b/documentation/=
overview-manual/concepts.rst
>> index 1faa790f3..3f3093bfc 100644
>> --- a/documentation/overview-manual/concepts.rst
>> +++ b/documentation/overview-manual/concepts.rst
>> @@ -1239,6 +1239,12 @@ variable is the function that determines whether =
a given dependency
>>   needs to be followed, and whether for any given relationship the
>>   function needs to be passed. The function returns a True or False valu=
e.
>>  =20
>> +.. note::
>> +
>> +   Is is possible to sign these artifacts with :wikipedia:`GPG
>
> typo: s/Is/It/
>
>> +   <GNU_Privacy_Guard>`. See :doc:`/security-manual/sstate-signing` in =
the Yocto
>> +   Project Security Manual for more information.
>> +
>>   Images
>>   ------
>>  =20
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-=
manual/variables.rst
>> index e713204e3..3b3aeed4c 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -10113,6 +10113,25 @@ system and gives an overview of their function =
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
>
> thought: I'm not sure we need to specify that the private key is used=20
> for signing. That's what signing in asymmetric cryptography is?
>
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
> thought: implement a file-based passphrase?
>
> The detach_sign() function actually supports providing the passphrase=20
> either as a string or from a file. The file-based implem seems to be=20
> actually used for signing (ipk, rpm, deb) packages, see=20
> IPK_GPG_PASSPHRASE_FILE and PACKAGE_FEED_GPG_PASSPHRASE_FILE.
>
> How much better that is in terms of security, unclear, as the file still=
=20
> needs to be readable but I guess at least the passphrase cannot leak=20
> when looking at the datastore (e.g. with bitbake -e).

This probably isn't too hard to implement if we have the support for packag=
e
signing already, yes.

>>      :term:`SSTATE_SKIP_CREATION`
>>         The :term:`SSTATE_SKIP_CREATION` variable can be used to skip th=
e
>>         creation of :ref:`shared state <overview-manual/concepts:shared =
state cache>`
>> @@ -10133,6 +10152,44 @@ system and gives an overview of their function =
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
>> +      when running the ``gpg --list-keys`` command (in bold text below)=
:
>> +
>> +      .. parsed-literal::
>> +
>> +         pub   ed25519 2026-04-17 [SC]
>> +               \4049A47E3AAA99D0250966DC\ **5B97632FA7F4E942**
>> +         uid           [ultimate] Antonin Godard (SState Signing) <anto=
nin.godard\@bootlin.com>
>> +         sub   cv25519 2026-04-17 [E]
>> +
>> +      The short form equals the last 16 characters of the identifier. I=
n the
>> +      above example: ``5B97632FA7F4E942``.
>> +
>> +      .. note::
>> +
>> +         Leaving this variable empty will make the :term:`OpenEmbedded =
Build
>> +         System` let any key installed on the :term:`Build Host` be use=
d for
>> +         verify the shared state artifacts, as long as its private key
>
> typo: s/verify/verifying/
>
> suggestion (non-blocking): reword
>
> A bit heavy to read, what about:
>
> """
> If this variable is empty (the default), any of the available GPG key=20
> can be used by the :term:`OpenEmbedded Build System` to verify the=20
> shared state artifacts.
> """
>
> In any case, I would strip the "as long as" part of the sentence, as=20
> that's how asymmetric cryptography works, you cannot validate a=20
> signature with a public key that isn't the other in the priavte-public=20
> key pair, that's the whole point of verifying a signature.
>
>> +         counterpart was used for signing them.
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
>> index 000000000..21cdff9fc
>> --- /dev/null
>> +++ b/documentation/security-manual/sstate-signing.rst
>> @@ -0,0 +1,285 @@
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
>> +For example, Debian based distributions provide it with the ``gpg`` pac=
kage name.
>
> typo: s/Debian based/Debian-based/
>
> typo: s/package name/package/
>
> suggestion (non-blocking): s/with/in/
>
>> +Install it as follows:
>> +
>> +.. code-block:: console
>> +
>> +   $ sudo apt-get install gpg
>> +
>> +Verify that your installation is successful by showing the version of G=
PG:
>> +
>> +.. code-block:: console
>> +
>> +   $ gpg --version
>> +
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
>> +You need a pair of public and private keys for two independent tasks:
>> +
>> +-  Signing the shared state artifacts that the :term:`OpenEmbedded Buil=
d System`
>> +   generates with your **private key**.
>> +
>> +-  Verifying the shared state artifacts with your **public key** when r=
e-using them.
>> +
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
>> +It will guide you through the steps of creating the key pair.
>> +
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
>> +to configure the build.
>> +
>
> issue: can you please synchronize this example with the one in=20
> SSTATE_VALID_SIGS?
>
>> +Configuring The Build System To Sign Shared State Artifacts
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Shared State Location
>> +---------------------
>> +
>> +The build system needs to be configured to sign new shared state artifa=
cts when
>> +they are generated. The generation of new artifacts is done once a task=
 has
>> +finished being executed.
>> +
>> +For the following sections let's assume that the build system has the s=
hared
>> +state directory location (:term:`SSTATE_DIR`) defined as follows::
>> +
>> +   SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
>> +
>> +Assuming this directory and the temporary directory (:term:`TMPDIR`) ar=
e empty,
>> +let's run the ``create_recipe_spdx`` task of the ``gettext-minimal-nati=
ve``
>> +recipe:
>> +
>> +.. code-block:: console
>> +
>> +   $ bitbake gettext-minimal-native -c create_recipe_spdx
>> +
>> +Let's take this command as an example throughout this document.
>> +
>> +After execution, the shared state directory should be populated with ne=
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
>> +   Despite its name, the `siginfo` file is unrelated to GPG signing.
>> +
>> +Enabling Shared State Signing
>> +-----------------------------
>> +
>> +Create a new :term:`configuration file` on your host **in a safe locati=
on** and
>> +add the two following statements::
>> +
>> +   SSTATE_VERIFY_SIG =3D "1"
>> +   SSTATE_SIG_KEY =3D "4049A47E3AAA99D0250966DC5B97632FA7F4E942"
>> +   SSTATE_SIG_PASSPHRASE =3D "<your GPG key passphrase>"
>> +
>> +It is advised to put these statements in a separate file as those conta=
in
>> +secrets and should not be shared. For this example, let's assume this f=
ile is
>> +``conf/sstate-sig-key.conf``.
>> +
>> +You can make sure this file is only owned by you and not readable by an=
other
>> +user with:
>> +
>> +.. code-block:: console
>> +
>> +   $ chown $USER:$USER conf/sstate-sig-key.conf
>> +   $ chmod o-rwx conf/sstate-sig-key.conf
>> +
>> +The statements in this file define:
>> +
>> +-  :term:`SSTATE_VERIFY_SIG`: setting this variable to "1" enables the =
shared
>> +   state signing feature.
>> +
>> +-  :term:`SSTATE_SIG_KEY`: the GPG key identifier for signing shared st=
ate
>> +   artifacts with the private key.
>> +
>> +   In the example, this corresponds to the identifier printed with the =
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
> issue: redundant "when creating the key"
>
> I can suggest removing the first "when creating the key", the end of the=
=20
> sentence is better worded.
>
>> +Let's test the configuration:
>> +
>> +#. Continuing with the ``gettext-minimal-native`` example, let's first =
clean the
>> +   existing shared state artifacts, to make sure my shared state artifa=
cts for
>> +   my ``do_create_recipe_spdx`` task are re-generated:
>> +
>
> issue: confusing switch to first-person
>
> We've been using the second person (you, let's, ...) until now.
>
>> +   .. code-block:: console
>> +
>> +      $ bitbake gettext-minimal-native -c cleansstate
>> +
>> +#. Run the ``create_recipe_spdx`` task for ``gettext-minimal-native``, =
but this
>> +   time pass the new ``sstate-sig-key.conf`` file to :term:`BitBake`:
>> +
>> +   .. code-block:: console
>> +
>> +      $ bitbake -R conf/sstate-sig-key.conf gettext-minimal-native -c c=
reate_recipe_spdx
>> +
>
> TIL about -R :)
>
> Another option is to make conf/local.conf `require` it?

Sure, but somehow it felt wrong hardcoding this in local.conf since
conf/sstate-sig-key.conf contains a secret. Not a very important distinctio=
n though

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
>> +A new ``.sig`` file was created: this means the artifact was successful=
ly
>> +signed, and the signature is stored in a separate ``.sig`` file.
>> +
>> +Verifying Signed Shared State Artifacts
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Now that you have set up the build to sign shared state artifacts, let'=
s see how
>> +you can verify them with the public key counterpart of the private key.
>> +
>> +.. note::
>> +
>> +   Signature of shared state and its verification can happen on two dif=
ferent
>> +   hosts, meaning one host can be in charge of the signature while anot=
her only
>> +   verifies the artifacts. This is preferred as the private key should =
not be
>> +   shared between multiple hosts.
>> +
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
>> +   which shared state artifacts are accepted.
>> +
>> +   This means that shared state will be reused **only if it was signed =
with the
>> +   private key corresponding to key identifier**.
>> +
>> +   You'll notice the short-form of the key identifier here, which are t=
he last 16
>> +   characters of the long-form key identifier shown with ``gpg --list-k=
eys`` (in
>> +   bold text below):
>> +
>> +   .. parsed-literal::
>> +
>> +      pub   ed25519 2026-04-17 [SC]
>> +            \4049A47E3AAA99D0250966DC\ **5B97632FA7F4E942**
>> +      uid           [ultimate] Antonin Godard (SState Signing) <antonin=
.godard\@bootlin.com>
>> +      sub   cv25519 2026-04-17 [E]
>> +
>> +Let's verify that signature verification works:
>> +
>> +#. First, remove temporary outputs (:term:`TMPDIR`) from the previous b=
uilds, to
>> +   make the :term:`OpenEmbedded Build System` rebuild everything using =
the
>> +   shared state:
>> +
>> +   .. code-block:: console
>> +
>> +      $ rm -rf tmp/
>> +
>
> question: Will this actually work?
>
> In the signing example, we only triggered a rebuild of=20
> gettext-minimal-native's create_recipe_spdx (and earlier) tasks. Every=20
> task which isn't from that recipe wasn't rebuilt as we only cleaned the=
=20
> sstate-cache from that recipe, therefore we would only use the shared=20
> state cache for the gettext-minimal-native recipe.

I think I see what you mean in that other tasks were not cleaned and so the=
ir
shared state weren't signed. Ideally you'd clean the entire content of the
sstate-cache/ directory before starting to sign artifacts. I think it might=
 be
the more sane approach indeed. I'll document to remove the shared-state cac=
he
directory.

Thanks!
Antonin

