Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE261CCFA03
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 11:50:47 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13418.1762429837592307573
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 03:50:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CUdSwY6z;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8801e4da400so10459246d6.3
        for <docs@lists.yoctoproject.org>; Thu, 06 Nov 2025 03:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762429836; x=1763034636; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ca7IZDmhwqxAtwJcEVJlN1QnHAEILc8ENm66owReKpo=;
        b=CUdSwY6zt6LT8EKsrCKaCittPR09GIa1RvDAk70p4o+gHNMyIdzwLm6QCFU1wRohGF
         fP64QemcqT9URz6vEsP+fLITRiDufy1Pjxl5XP9oUQiuB9sJkzgHgJrjw9k4D49wLn/r
         xJJVpiPDPFuCuTp/xEsfmAZFExZH+A4FDtTZ0KX8P10AjYC961X+Hst82aQTlMtL1WRn
         ZN0ctpeogswXaS9Dwt5FFsFibs/uUiSRrq8MEq9BmL1z96HLRKAvkjqA5urIsZtnI3gG
         tMepy+bTJVXDGjjlp7qXxL7A0vyIU/vWoLSnOyWzZhW0885ko5is7ujPQtlvfIWczbsf
         epdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762429836; x=1763034636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ca7IZDmhwqxAtwJcEVJlN1QnHAEILc8ENm66owReKpo=;
        b=axvphBjXBPssYc3gGbn0LNsa44Ir4l5d3Lpk+WkL8eGET997hEVCXx5n75UwKZAWyP
         7E4Vu7y6hZHmgf3lMYBlhpH0RJ4jefrbho4kwu4eKAMktZ0iiDDeeBLRpOWr7ON14ljU
         FtjLFOniHW2BmRt/G7is3rGgbb+mg29uFF2nIUULUsI8n7LP+rxmBAnMNlAUVnxvzdvb
         cZG4TzfWAY8if5JsijS7wmHXAUc21PKo56yGidHs9Ofz+O+OiHqkF0gtaZfvMeTE81zn
         gOuv5LtlSJkJfqWQrKTS5zx3qGP4uQRDgXlz1hWOhEO1eSMEynh3SckFHKaxhlFz1z6S
         2VmA==
X-Forwarded-Encrypted: i=1; AJvYcCXLDkjryM/cMwXhVaYYxBvVyie67+rEQn6ZFPWajeNs7G5JSHRDgTU8iX7HF720EAyGMl3/@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy+JVj6vt0qUKCTHebCXkuhb8RXZ4brILFXrX/axqhudRZf6sQe
	k/uHN5t6gG9ZsASWolQSL3SgIklQ5JgmOgIh5DuzUW8T+89cx0DSHC2ROIAs1DPYyPjTtY4C2Am
	ZdvvYWWwlCULFXqssHVwxd/uB5nBcaHs=
X-Gm-Gg: ASbGncuAUcclt0spLUcAwqJHWqKrhntEvMjgnxLacYJthU+ulYUml2p1ORk4nRItBjr
	803vAuhCo5EGugcZ55/CnQ4IAfjr8GBNj46mKsWwriApN7b1ike6M8yIT/K6wQpxVq4rW/gPtLO
	OYKHUFVOFSRHB0VcSgU3vJw97OPhG/3R8WyEmInxbRJf8krQkTUVWYFRrjU95ozsCoJdbrMBMWK
	0dhXPJhYkly7kri7B+oi97YmuaWrqI3NIge/dRFPjohfDUnHHdzbpk8OQ==
X-Google-Smtp-Source: AGHT+IFmzJj07Q4NppuaZLfNZN99/JTELUYCK/2FuV3VThiID1Xu20OvgdVJIMDiy+j/tD0kgMUUx6IzsqOdRTSk/i4=
X-Received: by 2002:ad4:5ae1:0:b0:880:460a:96ce with SMTP id
 6a1803df08f44-880712226b9mr97558176d6.63.1762429836508; Thu, 06 Nov 2025
 03:50:36 -0800 (PST)
MIME-Version: 1.0
References: <20251105232718.2801446-1-yoann.congal@smile.fr>
 <DE1GB2U0LTRC.11DTXWB7ZUB7T@bootlin.com> <CANNYZj_KS5BKsGMiQkLSyCKtma_BYcqJ+W3_jw80SzR6D-80Pw@mail.gmail.com>
 <DE1HVJAH8J7U.29XUESHFLVEGD@bootlin.com>
In-Reply-To: <DE1HVJAH8J7U.29XUESHFLVEGD@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Nov 2025 12:50:25 +0100
X-Gm-Features: AWmQ_bnysqalFcp1AX699N-CQHVG1E3C4JepWC1YCa7S7cvm50O65TylzXj0qdY
Message-ID: <CANNYZj8+BELKtPY+0bojL+zv4tbCsqgxmYUXnWLpr28urbCCSQ@mail.gmail.com>
Subject: Re: [docs] [master-next][PATCH] bitbake-user-manual-environment-setup:
 Document "{THISDIR}" in bb-layers
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Yoann Congal <yoann.congal@smile.fr>, bitbake-devel@lists.openembedded.org, 
	Yocto Docs ML <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Nov 2025 11:50:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8009

On Thu, 6 Nov 2025 at 10:12, Antonin Godard <antonin.godard@bootlin.com> wr=
ote:
> >>       This useful for a project that holds a single :term:`generic
> >>       configuration` file next to a local layer::
> >>
> >>          =E2=94=9C=E2=94=80=E2=94=80 meta-myproject/
> >>          =E2=94=94=E2=94=80=E2=94=80 myproject.conf.json
> >
> > I thought the use case should be described along these lines:
> >
> > This is useful when (one or more) configuration files and (one or
> > more) layers are hosted in the same git repository, which is cloned
> > and managed independently from bitbake-setup workflows.
>
> Rephrased, thanks. I'm about to send the v2.

Note I just sent
https://lists.openembedded.org/g/bitbake-devel/message/18285

I do apologize for shifting the configuration format like this at the
last moment, but I do believe avoiding tokens and not doing
post-prosessing on values is beneficial for clarity and validation.

Alex

