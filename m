Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D03CD132D5
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 14:35:33 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.58846.1730730926236619068
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 06:35:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=jNs5bbBn;
 spf=pass (domain: baylibre.com, ip: 209.85.218.46, mailfrom: jstephan@baylibre.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9eaf93e40dso7619666b.0
        for <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 06:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730730925; x=1731335725; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRO5DmhxlDoAyUOu/snvXEplmDxeMRHcJbfI9LUWVlg=;
        b=jNs5bbBns0oBo5oc+D+KICJY36vGM8Agq7U898xqeg44wSkqUkjHg34SnqSfBtUZiD
         gpaxXjU1a8QIJaYxIg8gZ/q0ajlVc30OZXxX4Q57rwQXQ+w0+Pj0GOs4gPKOigGew1BB
         WNnXjKPN9X6fPLuRrLQmmq49bxRp6U6f9U/DgwQqeoBjLtY+7AiZO3y0OSvS24h+Jyu3
         kD2SgRFNzzNUv3LJvX4D5QYY2Wb7FC8BnzLbEBHP60gQouCdpt+vSrWdpcakzFAes7C3
         tztifi18CCtRSaBwS1NvMfABcLoDbJ0oPA7gjEVby7ewKSOlKxoJIjTzIua8ah3ybvaA
         fnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730730925; x=1731335725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRO5DmhxlDoAyUOu/snvXEplmDxeMRHcJbfI9LUWVlg=;
        b=mQBCYDWs0TXYZ5d+exuRw9yAiln3Mtjhx8dLywZSAE4PnzuFUZQk2oYiXjSwfRkHZh
         2+SfKPRE/rgi6kBJ92xVC/igZoDMp/ihqkEODCFnSh3ecJuPHMIB/H9NA5JUUP9ewz2q
         nlqwhf9tC+pwagpvVP1mzT3R4ocH/muSyWHEWzWy+yc7/nMkjplQM9YHC1sjEslGpO+e
         fhvVTk18/V+lzsdOadyCTQTm+UaiBplz7tLqOaQoQXwBFBafS3FvGQY6YW0M+1bYe9Mm
         I8TADU2Nj2jJq4zU3QdOUp3d2JMU4u1YWF+Z8FPV7gpubLxRL1TWY6aKvJ26O3eyvkGA
         wxaA==
X-Gm-Message-State: AOJu0YwzxYv3Opd84EvVqwWOKXsLqnqi6KQYF7xpnVuvHtgk4OmHXWqr
	Qa07ME1hQMhYY0BYJNfwrnN1qGt2eNOKcVv37A5KCCNbU4YGoX65GBaZDBGWL+GO/oyhhywMQMb
	Oc3IqvGk3HV+hJZj/2l6FaimmNm0a9sDuFNVhHA==
X-Google-Smtp-Source: AGHT+IHLn/l7JKhGi0fx97ut0tjOjtPV+a9lxRA3CSLaAgkPmiBrqNWGFNAF0OkfHb68/kecLSeX0P07IBhi4GwbnpI=
X-Received: by 2002:a17:907:948b:b0:a9a:835b:fc8e with SMTP id
 a640c23a62f3a-a9de6330780mr3274244466b.54.1730730924558; Mon, 04 Nov 2024
 06:35:24 -0800 (PST)
MIME-Version: 1.0
References: <20241031-add-bblock-documentation-v1-0-32b89093bbda@baylibre.com>
 <20241031-add-bblock-documentation-v1-4-32b89093bbda@baylibre.com> <D5DFKMTI5D6B.3I1ZUOVA7YSR3@bootlin.com>
In-Reply-To: <D5DFKMTI5D6B.3I1ZUOVA7YSR3@bootlin.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 4 Nov 2024 15:35:13 +0100
Message-ID: <CAEHHSvY1EM3uq-6uOZwprcNOsNUENYrHqhCY8bR4hT2Yt1-ttQ@mail.gmail.com>
Subject: Re: [docs] [PATCH 4/5] ref-manual: variables: add SIGGEN_LOCKEDSIGS* variables
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 14:35:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5661

Le lun. 4 nov. 2024 =C3=A0 14:32, Antonin Godard
<antonin.godard@bootlin.com> a =C3=A9crit :
>
> Hi Julien,
>
> On top of Ulrich's comments, here are my suggestions/corrections:
>
> On Thu Oct 31, 2024 at 5:56 PM CET, Julien Stephan wrote:
> > Variables SIGGEN_LOCKEDSIGS, SIGGEN_LOCKEDSIGS_TASKSIG_CHECK and
> > SIGGEN_LOCKEDSIGS_TYPES are used to lock specific tasks to specific
> > signatures. They are used by bitbake -S <lockedsigs> and bblock, so add
> > documentation for them.
> >
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> >  documentation/ref-manual/variables.rst | 33 ++++++++++++++++++++++++++=
+++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/documentation/ref-manual/variables.rst b/documentation/ref=
-manual/variables.rst
> > index 07ed143ac5606617c720301ac6621355a341f90a..8cfb978e795e43e3ef25f3e=
18e11baf7c2a28d54 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -7880,6 +7880,39 @@ system and gives an overview of their function a=
nd contents.
> >           might break at runtime if the interface of the recipe was cha=
nged
> >           after the other had been built.
> >
> > +   :term:`SIGGEN_LOCKEDSIGS`
> > +     The list of locked taks, with the form::
> > +
> > +       SIGGEN_LOCKEDSIGS +=3D "<package>:<task>:<signature>"
> > +
> > +     If ``<signature>`` exists for the specified ``<task>`` and ``<pac=
kage>``
>
> How would I find such a signature by hand? Maybe worth explaining it here=
?
>
> > +     in sstate, BitBake will use the cached output instead of rebuildi=
ng the
> > +     ``<task>``. If it does not exist, BitBake will build the ``<task>=
`` and
> > +     the sstate will be used next time.
>
> Could you give a real-life example of that at the end here?
>
> > +   :term:`SIGGEN_LOCKEDSIGS_TASKSIG_CHECK`
> > +     Specifies the debug level of task signature check. 3 levels are s=
upported:
> > +
> > +     * info: displays a "Note" message to remind user that a task is l=
ocked
> > +       and current signature matches the locked one.
> > +     * warn: displays a "Warning" message if a task is locked and curr=
ent
> > +       signature does not match the locked one.
> > +     * error: same as warn but displays an =E2=80=9CError=E2=80=9D mes=
sage and abort.
>
> For "info", "warn" and "error" could you enclose that in double ticks? ``=
info``
> and so on.
>
> > +   :term:`SIGGEN_LOCKEDSIGS_TYPES`
> > +     Allowed overrides for :term:`SIGGEN_LOCKEDSIGS`. This is mainly u=
sed
> > +     for achitecture specific lock. A common value for :term:`SIGGEN_L=
OCKEDSIGS_TYPES`
>
> s/achitecture/architecture/
>
> By "mainly", do you mean "only" or could there by anything other than
> architectures covered by the variable?

You can literally put anything you want in this variable..

> > +     is ``${PACKAGE_ARCHS}``::
> > +
> > +       SIGGEN_LOCKEDSIGS_TYPES +=3D "${PACKAGE_ARCHS}"
> > +
> > +       SIGGEN_LOCKEDSIGS_core2-64 +=3D "bc:do_compile:abcd"
> > +       SIGGEN_LOCKEDSIGS_cortexa57 +=3D "bc:do_compile:efgh"
>
> Maybe real hashes would be better here
>
> > +
> > +     Here, the ``do_compile`` task from ``bc`` will be locked only for
> > +     ``x86-64`` and ``arm64`` but not for other architectures such as
>
> Wouldn't it be locked for ``core2-64`` and ``cortexa57`` more specificall=
y? I
> might misunderstand something here. :)

You're right. I wanted to give an example for machines first, then
decided to keep architecture and forgot to update.
Thank you  for pointing it out.


>
> > +     ``qemumips``.
> > +
> >     :term:`SITEINFO_BITS`
> >        Specifies the number of bits for the target system CPU. The valu=
e
> >        should be either "32" or "64".
>
> Also I could suggest splitting the series in patches for sphinx-lint/vale=
 and
> patches for documentation of variables/bblock.

Sure, I'll do that

Cheers
Julien
>
> Thanks!
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

