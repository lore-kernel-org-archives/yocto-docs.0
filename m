Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F199CFF8868
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 15:33:52 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47906.1777304029925207153
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 08:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cfLR5WLE;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E440EC5CD4A
	for <docs@lists.yoctoproject.org>; Mon, 27 Apr 2026 15:34:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE759600D1;
	Mon, 27 Apr 2026 15:33:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 495D510728201;
	Mon, 27 Apr 2026 17:33:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777304012; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eBzlSCos3F3I0PbUc1+62ztGF7LbM3EljgEj8wu8KTE=;
	b=cfLR5WLEweHHpCSG3PxBJuhn2de+ULFRivCaGVtHHSz2rU94dmmqrRE+KOycmh5uetRCMD
	fb//US2hYn5h22yU8bHMaI0GEc+161CXeZ6ApJ3gPPrdd/ffIVvjW5O2zg2FtL3JeUeWc7
	kbQU3uyavQT7HukUx1fWYTfsd1XtqgEgTXig6Rr0M3rk93LLABt07HTRM7omS7EL0M+n6c
	eFiDhkfKH14DwUx+dM2p6nQmPlstp+L6tGnIU8SEXSfBU9wtNLY0wdKYoDNT/Zez7FBjku
	IScrEDHVlGWv6v0fJN1EyEyBTQVrzijo+0d5S4zAPesnZdJboq6g5U16Q8av9w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Apr 2026 17:33:30 +0200
Message-Id: <DI41OUUEK11E.3GOUTLCIKCHUC@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] Document shared state signing
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20260421-sstate-signing-v2-1-7b572121f2fd@bootlin.com>
 <a4723996-6d07-41b1-a40b-35e12e48807f@cherry.de>
 <DI40MO4BDL1R.306ON3EYMK35F@bootlin.com>
 <1bcdee06-4590-42ae-afb7-1948d21d616f@cherry.de>
In-Reply-To: <1bcdee06-4590-42ae-afb7-1948d21d616f@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Apr 2026 15:33:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9374

Hi,

On Mon Apr 27, 2026 at 5:08 PM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 4/27/26 4:43 PM, Antonin Godard wrote:
>> Hi,
>>=20
>> On Fri Apr 24, 2026 at 5:18 PM CEST, Quentin Schulz via lists.yoctoproje=
ct.org wrote:
>>> Hi Antonin,
>>>
>>> On 4/21/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> [...]
>>>> +   :term:`SSTATE_VALID_SIGS`
>>>> +      When verifying :ref:`shared state <overview-manual/concepts:set=
scene tasks
>>>> +      and shared state>` artifacts (when :term:`SSTATE_VERIFY_SIG` is=
 set to
>>>> +      "1"), the :term:`SSTATE_VALID_SIGS` variable is a space-separat=
ed list of
>>>> +      :wikipedia:`GPG <GNU_Privacy_Guard>` key identifiers to use to =
verify their
>>>> +      signature.
>>>> +
>>>> +      It must contain the short form identifier of the key pair. For =
example,
>>>> +      when running the ``gpg --list-keys`` command:
>>>> +
>
> What happens if this variable is empty? My reading of=20
> meta/lib/oe/gpg_sign.py:LocalSigner:verify() hints at *any* key that=20
> verifies the signature will do.

I think that's what happens, when reading again. I'll add this to the varia=
ble's
description.

>>>> +      .. parsed-literal::
>>>> +
>>>
>>> You could use
>>>
>>> .. code-block:: console
>>>
>>>      $ gpg --list-keys
>>>      pub....
>>>
>>> to avoid having to use a literal include.
>>=20
>> This use of parsed-literal was intended, as it shows the last 16 charact=
ers in
>> bold. I'll add " (in bold text below)" before the colon.
>>=20
>
> We can also use
>
> :emphasize-lines: <line-no>[, <line-no>...]
>
> in code-blocks, see=20
> https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.ht=
ml#directive-option-code-block-emphasize-lines

I want to highlight a specific portion of a line, I don't think this does t=
hat?

> [...]
>
>>>> +.. note::
>>>> +
>>>> +   The `siginfo` file is not related to GPG signing.
>>>> +
>>>
>>> But the first file also not since we haven't enabled signing yet, what
>>> did you want to say here?
>>=20
>> Avoid confusion as "siginfo" could make someone think of "signatures" an=
d hence
>> signing/gpg. Is adding the note more confusing?
>>=20
>
> Ah, yes this makes sense to specify this.
>
> What about
>
> Despite its name, the `siginfo` file is unrelated to GPG signing.

Agreed, clearer

>>>
>>>> +Enabling Shared State Signing
>>>> +-----------------------------
>>>> +
>>>> +Create a new :term:`configuration file` on your host **in a safe loca=
tion** and
>>>
>>> What makes a location safe?
>>=20
>>> I would suggest to put it somewhere in $HOME/.config/ maybe?
>>=20
>> Maybe, but I don't think that makes it safer?
>>=20
>
> It puts it outside of a possibly versioned repository, but in itself,=20
> not better no.
>
>>> Since it contains a secret, we should probably also recommend to do
>>>
>>> chmod o-rwx <file>
>>=20
>> Yes, I'll add that.
>>=20
>>> no (and possibly chown $USER:$USER <file> ?)
>>=20
>> This should be the default when creating the file but I can add that.
>>=20
>
> Fair enough.
>
> [...]
>
>>>> +It is advised to put these statements in a separate file as those con=
tain
>>>> +secrets and should not be shared. For this example, let's assume this=
 file is
>>>> +``conf/sstate-sig-key.conf``.
>>>> +
>>>> +These statements define:
>>>> +
>>>> +-  :term:`SSTATE_VERIFY_SIG`: setting this variable to "1" enables th=
e shared
>>>> +   state signing feature.
>>>> +
>>>> +-  :term:`SSTATE_SIG_KEY`: the GPG key identifier for signing shared =
state
>>>> +   artifacts with the private key.
>>>> +
>>>> +   In our example, this corresponds to the identifier printed with th=
e ``gpg
>>>> +   --list-keys`` command :ref:`above <security-manual/sstate-signing:=
Generating
>>>> +   A Public And Private Key Pair With GPG>`.
>>>> +
>>>> +-  :term:`SSTATE_SIG_PASSPHRASE`: the passphrase used to protect your=
 private
>>>> +   key when creating the key, chosen when creating the key pair.
>>>> +
>>>
>>> Am I the only bothered this is an option? Is there no way to use a
>>> keyring or the gpg-agent instead?
>>=20
>> I don't think so, no.
>>=20
>
> Terrible security practice :(

Yeah I agree. Maybe it's worth opening an enhancement "bug" on Bugzilla for
this, what do you think?

>>>> +Let's test our configuration:
>>>> +
>>>> +#. Continuing with our ``gettext-minimal-native`` example, let's firs=
t clean the
>>>> +   existing shared state artifacts:
>>>> +
>>>> +   .. code-block:: console
>>>> +
>>>> +      $ bitbake gettext-minimal-native -c cleansstate
>>>> +
>>>
>>> Why do we need to clean the cache (I'm assuming because you want to mak=
e
>>> sure the artifacts you sign are the one you just generated and not
>>> malicious ones, but I think it'd be worth explaining this is not a
>>> limitation but a design decision (IFF I really guessed that right)).
>>=20
>> I'm giving an example here, and want to make sure my share state artifac=
ts are
>> re-generated.
>>=20
>
> Then say this :)

Fair enough, I will!

> [...]
>
>>>> +#. Then, run the task again:
>>>> +
>>>> +   .. code-block:: console
>>>> +
>>>> +      $ bitbake gettext-minimal-native -c create_recipe_spdx
>>>> +
>>>> +#. To make sure the shared state artifact was successfully used, look=
 for the
>>>> +   :ref:`setscene <overview-manual/concepts:setscene tasks and shared=
 state>` task
>>>> +   for ``create_recipe_spdx`` in the latest log file from :term:`BitB=
ake`:
>>>> +
>>>> +   .. code-block:: console
>>>> +
>>>> +      $ grep create_recipe_spdx_setscene tmp/log/cooker/<machine>/con=
sole-latest.log
>>>> +      NOTE: Running setscene task 1 of 1 (../layers/openembedded-core=
/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb:do_create_recipe_s=
pdx_setscene)
>>>> +      NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_reci=
pe_spdx_setscene: Started
>>>> +      NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_reci=
pe_spdx_setscene: Succeeded
>>>> +
>>>> +   Our shared state was successfully verified and used!
>>>
>>> Is there any indication in the logs that verification was actually
>>> performed?
>>=20
>> No, I didn't find any in the code, or with any verbosity level
>>=20
>
> Maybe something we should add? This seems like an important piece of=20
> information to have.

Yes, I agree.

> What about
>
> diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
> index ede6186c84..fa339644fd 100644
> --- a/meta/lib/oe/gpg_sign.py
> +++ b/meta/lib/oe/gpg_sign.py
> @@ -132,8 +132,11 @@ class LocalSigner(object):
>           status =3D subprocess.run(cmd, stdout=3Dsubprocess.PIPE,=20
> stderr=3Dsubprocess.PIPE)
>           # Valid if any key matches if unspecified
>           if not valid_sigs:
> -            ret =3D False if status.returncode else True
> -            return ret
> +            if status.returncode:
> +                return False
> +
> +            bb.note("Signature file %s successfully verified with unspec=
ified key" % (sig_file))

Maybe `bb.debug`?

> +            return True
>
>           import re
>           goodsigs =3D []
> @@ -145,6 +148,7 @@ class LocalSigner(object):
>
>           for sig in valid_sigs.split():
>               if sig in goodsigs:
> +                bb.note("Signature file %s successfully verified with ke=
y %s" % (sig_file, sig))
>                   return True
>           if len(goodsigs):
>               bb.warn('No accepted signatures found. Good signatures=20
> found: %s.' % ' '.join(goodsigs))
>
>
> ? I think we may have a few people resisting this as I'm guessing this=20
> is on the hot path so adding messages isn't the best (even if disabled=20
> most of the time).

I see what you mean. You might be a bit more convincing by passing them thr=
ough
bb.debug?

Thanks,
Antonin

