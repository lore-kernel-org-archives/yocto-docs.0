Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EE5FF886D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 08:27:29 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8263.1777364847848132379
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 01:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iNYHdWAy;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A53C91A346B
	for <docs@lists.yoctoproject.org>; Tue, 28 Apr 2026 08:27:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64414601D0;
	Tue, 28 Apr 2026 08:27:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45DA61072851A;
	Tue, 28 Apr 2026 10:27:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777364845; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3HAVs0IiJxzazF3MYF2vXILn7rdxRFhKAgp/RPwt924=;
	b=iNYHdWAy4SMuyjJA55kqfQv0Vb5DqBjfj5aSACryz+nny+1GmpvqN3remImw/U8D0XDmZM
	nVPbBlSJutvqbEvrrG8C88Adqb0q7WoUjmOjTCrhk16vMzNFgcZkKUcO6sj0/RDXZ2l4z7
	oClURBNHMhVRt2AkzL5vkrIOcoaOdBb9iuR2Q9wrY3vKZtXtlRmEV5WGSkVqkZmpc3+6kL
	YAqczjmLQz6FHdA0DyyW5aT5MwMdKfZWY/KI7ssczR9m1Ea9fLxwUDzMYQsEmhAR9XMGGs
	UAi+dB4Mn1RxsmrgZin4rmA7xZq8eO8oOQdrm53C9vi9J6GoLXVilDn4QxOBjw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 10:27:23 +0200
Message-Id: <DI4N955YCS67.3IN39HM7NOLNS@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] Document shared state signing
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20260421-sstate-signing-v2-1-7b572121f2fd@bootlin.com>
 <a4723996-6d07-41b1-a40b-35e12e48807f@cherry.de>
 <DI40MO4BDL1R.306ON3EYMK35F@bootlin.com>
 <1bcdee06-4590-42ae-afb7-1948d21d616f@cherry.de>
 <DI41OUUEK11E.3GOUTLCIKCHUC@bootlin.com>
 <abcb5550-13d9-4873-9ff9-df76e55d7fb9@cherry.de>
In-Reply-To: <abcb5550-13d9-4873-9ff9-df76e55d7fb9@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Apr 2026 08:27:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9377

Hi,

On Mon Apr 27, 2026 at 6:44 PM CEST, Quentin Schulz wrote:
[...]
>
>>> +            return True
>>>
>>>            import re
>>>            goodsigs =3D []
>>> @@ -145,6 +148,7 @@ class LocalSigner(object):
>>>
>>>            for sig in valid_sigs.split():
>>>                if sig in goodsigs:
>>> +                bb.note("Signature file %s successfully verified with =
key %s" % (sig_file, sig))
>>>                    return True
>>>            if len(goodsigs):
>>>                bb.warn('No accepted signatures found. Good signatures
>>> found: %s.' % ' '.join(goodsigs))
>>>
>>>
>>> ? I think we may have a few people resisting this as I'm guessing this
>>> is on the hot path so adding messages isn't the best (even if disabled
>>> most of the time).
>>=20
>> I see what you mean. You might be a bit more convincing by passing them =
through
>> bb.debug?
>>=20
>
> Sure, I randomly picked bb.note() but anything will do (though, does it=
=20
> appear in the logs, which is what we're after after all?). Even=20
> bb.debug() writes to the mainlogger, so I'm assuming there's *some* cost=
=20
> even if it's not printed. Did you try? Does it work? (Because I just=20
> wrote this without even running bitbake with it :D)

I tested this and this works fine. The messages will be printed when passin=
g -v
to bitbake (verbose), so I guess bb.note is fine.

Maybe I'd re-organize a bit and do:

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index ede6186c84f..9024b349ef2 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -130,10 +130,6 @@ class LocalSigner(object):
=20
         cmd +=3D [sig_file]
         status =3D subprocess.run(cmd, stdout=3Dsubprocess.PIPE, stderr=3D=
subprocess.PIPE)
-        # Valid if any key matches if unspecified
-        if not valid_sigs:
-            ret =3D False if status.returncode else True
-            return ret
=20
         import re
         goodsigs =3D []
@@ -143,8 +139,18 @@ class LocalSigner(object):
             if s:
                 goodsigs +=3D [s.group(1)]
=20
+        # Valid if any key matches if unspecified
+        if not valid_sigs:
+            if status.returncode:
+                return False
+
+            bb.note("Signature file %s successfully verified with key(s): =
%s" %
+                    (sig_file, goodsigs))
+            return True
+
         for sig in valid_sigs.split():
             if sig in goodsigs:
+                bb.note("Signature file %s successfully verified with key =
%s" % (sig_file, sig))
                 return True
         if len(goodsigs):
             bb.warn('No accepted signatures found. Good signatures found: =
%s.' % ' '.join(goodsigs))

To show which key on the host verified our file. What do you think?

Antonin

