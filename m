Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15437C021B8
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 08:03:30 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.3544.1740470609604222052
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 00:03:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FNu3YBVY;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e6698667c7so64951466d6.2
        for <docs@lists.yoctoproject.org>; Tue, 25 Feb 2025 00:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740470608; x=1741075408; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3fW6YDN1P4Qh2iMJEnqeN68LzUnYMK5pJLaqhdsQa0=;
        b=FNu3YBVYBHfhPwakMdUs2Zn7BqRsfk24xQrw1Hu1P3l9KYHr4wIte8gVQJ5EwC53Gv
         UiD9OodFAqkCHdKAFaZ1YyICuvctuF6NYP9FtKZXRpjnJMOnHKTSrSULlcgRwNP3g4af
         moCfXvUQ+6cDoH7dlzF5v3dOK9V+mGQmF8fN1bhewyiLmSnF/L2yD3NrKbmjKTIUnN/c
         cUYbA9MGnBsyRnTEypG+5co8C58pdjSFJf+38TX3oMbi1VDbX73maUNBaWsCQ5SbiQD7
         /WKFeFokfCPiIR1+HIGVp51cPLeSaH8mbFyK42f1r0HWSkOh+C9Rk9lREHdHaiRia6BM
         xRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740470608; x=1741075408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h3fW6YDN1P4Qh2iMJEnqeN68LzUnYMK5pJLaqhdsQa0=;
        b=p+6zwMWn6KWg+vP3l15LnvQtdvbhH9V9sWVGY3hojLF7hFLLeQE3BZDD4BeaeK6VFN
         JVshcv1pSDUMPbpA+v2ql6Vaamy929L2+WXF8cztZYY12zgJOUktuUcfOICj7psOP3D1
         NQq5Xs9RNVSCMX9IfRQ8JEAigjipp8IDaFHWoTCQ7XtoSPCcIk89xgF82RlIUihjly/j
         xapUaCfZo3BDHCpEYQPZXtW0kOEJwTswMjB/7fsXW0WZsC6ovB8o3jD4BfevB4jfPwC8
         UkB5UydgHD+nQe1c9jym2U3X0Xuxu1w4ZrTOEpM7fK2qwun4tm7p9gKLhgTzLSFvG0wZ
         EoCg==
X-Forwarded-Encrypted: i=1; AJvYcCVOBCZyAbYxq1jrNeHBCuXRNekE+p0mdImoKs8ov2ioXpibjsSb8siDjQCFTibXVLDIdFjR@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwBvzE+1BBJqHvAGi9ezPWZCrfvvTduiMyaEv+QVYgY4scQZ5ey
	kM+FZVYXLqv2CeTt1BksqU3sdIrDalKiBjvsbWxHsO/IteiJYfVXsrv5YFN9/9L9q/JtE7NyWaS
	zTPAkW6AvOqqZ0cDAsM6IzfhyAK37Gw==
X-Gm-Gg: ASbGnctiGFQBKlRlf2hRIxr8MkI8KXKqg/YdJRBhSEGh3unqJs9wnlKcPRpXDpkh1yR
	97XQz8pbGe8jVsIIIj7jVpEfzweFKTd7Ec/hz/+zD8G2zDB4xadS7Djql3wo16eHggDRsomk3F8
	v/KtYCUiQdGXxEbwjfcherQPnrrt2Qqkj/sgyMhhbkEg==
X-Google-Smtp-Source: AGHT+IGkikz42Y0ykhIQ5BpMHtCr6A2dzfNT+LRv8Glg+FbN+RVFKhM/3K+oNvKxuP/s0BoKc2dTPg/d4V7pa6iZ4sg=
X-Received: by 2002:a05:6214:246f:b0:6d8:a730:110c with SMTP id
 6a1803df08f44-6e87abafb28mr26274146d6.38.1740470608463; Tue, 25 Feb 2025
 00:03:28 -0800 (PST)
MIME-Version: 1.0
References: <20250225070631.2262115-1-l.goehrs@pengutronix.de> <20250225070631.2262115-2-l.goehrs@pengutronix.de>
In-Reply-To: <20250225070631.2262115-2-l.goehrs@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Feb 2025 09:03:17 +0100
X-Gm-Features: AQ5f1JqUkkAZbWDV84TIvly4OmMz9iCwMfLtCEJs-BXTpRekrKh6BAiDcxQgEIs
Message-ID: <CANNYZj_Qk1ftZK36EcP-QxA6sWEexThj=th-iNA=EsoWA4ifAg@mail.gmail.com>
Subject: Re: [bitbake-devel] [PATCH v1 2/5] fetch2/github_release_artifact:
 fetcher for (private) release artifacts
To: l.goehrs@pengutronix.de
Cc: bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Feb 2025 08:03:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6444

On Tue, 25 Feb 2025 at 08:06, Leonard G=C3=B6hrs via lists.openembedded.org
<l.goehrs=3Dpengutronix.de@lists.openembedded.org> wrote:
> Authentication is provided using tokens. In the simplest form a personal
> access token hardcoded in a recipe file:
>
>   GH_TOKEN =3D "github_pat_...
>   SRC_URI =3D "ghra://github.com/rauc/rauc/v1.13/rauc-1.13.tar.xz"
>   SRC_URI[sha256sum] =3D "1ddb218a5d713c8dbd6e04d5501d96629f1c8e252157...
>
> Or as part of the URI:
>
>   SRC_URI =3D "ghra://github.com/rauc/rauc/v1.13/rauc-1.13.tar.xz;token=
=3Dg...
>   SRC_URI[sha256sum] =3D "1ddb218a5d713c8dbd6e04d5501d96629f1c8e252157...

This is really insecure. You need to find a way for wget to pick up
the needed token and produce a header directly from netrc or similar
file that is managed outside of layer metadata.

Alex

