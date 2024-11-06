Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C544D44D74
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 14:05:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.46248.1730901949549750947
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 06:05:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aJ65N0RS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-431481433bdso60105645e9.3
        for <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 06:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730901948; x=1731506748; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QKPcwCGt4tw0u/hOVX5h3jUFmU7Y60hDkqQVfGsbvlU=;
        b=aJ65N0RSekpYcsjy5H7YcdIiF/AHLZDYPibdPVTAMKrtXAJQAL/vx3CyVGLb2F3NZJ
         2krt+VRHQuiNxARqWWBOzMYYQUw6OEB9z+g1ncDBGTlQH4/PYgr06FJ+H5ezc34rEYIx
         a4XPmxYoVQtlEDFRJL01A2yJeTxmcJN8Hz14o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730901948; x=1731506748;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QKPcwCGt4tw0u/hOVX5h3jUFmU7Y60hDkqQVfGsbvlU=;
        b=D8ndjyufVMXVhVZv4b448OASaPUz3FDyB1vxd2RSFgvKeEylYWCb2NGypEMd1VDwHP
         amFHiPHmEASnnShq8lYGcbbDghUMpWB0ZEZq6tivRTHvuz87eaxbakEU6+MVc8jyzUrQ
         Wn+Kj2a+Ylxq+IFQuG8EDjepCgIqg6Tpl4csEXcwwsIz7VTgr1fB/IiEzTNU31NLxMRH
         8BJtHSiR5lbGNLVqq0FltBkJGSfW07vdQ09JOqaGOqKZKyusvJgYrNV32OBHW1ChxYa4
         Rn5TzTnXTkkw8TJl/IzCkZCCnBsJKGpYokIwVzFqU7KCWGAO1JCR88LV78zJ15Fctyi2
         30BA==
X-Forwarded-Encrypted: i=1; AJvYcCW894n6xGvCbzX2+CkM9FGXVaeBorAGb7tYWCLREG7lxUe9I044AVKMhxrdZWnA/LpItTe6@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyLB6Gmh/fSQAFrI+Adz51kcedAot1D0PhON5j2WZF+jHyobWqd
	Kd90wU3grOe+tfCT/BkeYkiVG6WGp3w2Rm+RSUAmUoOaX6MRcQh3JiDV75qhXHk=
X-Google-Smtp-Source: AGHT+IG+uw+DiAQ0NJWdk1hBtTpJotzHrEJN8NCefPUwZhdpJRa5moaT7tTol7Dk+Bfnmis4Krprzw==
X-Received: by 2002:a05:600c:1f91:b0:426:66a2:b200 with SMTP id 5b1f17b1804b1-4327b6c79f7mr218499695e9.0.1730901943091;
        Wed, 06 Nov 2024 06:05:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f26:5175:55ad:9264? ([2001:8b0:aba:5f3c:5f26:5175:55ad:9264])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d49d4sm19224215f8f.34.2024.11.06.06.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 06:05:42 -0800 (PST)
Message-ID: <edaf7b222f5fda8d8ad73c6962ad6ea77835ba96.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/5] Add support for PDF/Epub generation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Michael Opdenacker
	 <michael.opdenacker@bootlin.com>
Date: Wed, 06 Nov 2024 14:05:41 +0000
In-Reply-To: <20241106-pdf-xetex-v1-0-044eab7e77d3@bootlin.com>
References: <20241106-pdf-xetex-v1-0-044eab7e77d3@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 14:05:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5703

On Wed, 2024-11-06 at 08:48 +0100, Antonin Godard wrote:
> This patch series includes commits that enable PDF and Epub generation
> during `make publish` and that includes them in the sidebar as a new
> "Documentation Downloads" section. The files can be downloaded directly
> from there and are displayed as a list in this page.
>=20
> Example outputs:
>=20
> - PDF: https://lufi.bootlin.com/r/PBq0qGTwBy#6JIczWeLiAjcwn9udqAeTaoHuZho=
Xq6sL/vpktteg5w=3D
> - EPub: https://lufi.bootlin.com/r/_wRND0dvKD#88YA3opgX/CJTaGT3m5GxKBMBYe=
NfcR2VN3x7wnCU/E=3D
>=20
> This patch series also changes the following:
>=20
> - Don't use inkscape but rsvg-convert, a lighter tool for SVG conversion
> =C2=A0 that can be included in a buildtools tarball.
> - Build the PDF with xelatex instead of pdflatex, to support foreign
> =C2=A0 characters (the pdf build is currently failing because of that).
>=20
> On the autobuilder, the necessary was made to make texlive/xelatex and
> so on available to the docs build (see run-docs-build).
>=20
> The series also brings a change to switchers.js.in, to make the file
> compatible with newer versions of Sphinx. Note: on the autobuilder, we
> aim to build using the newer Sphinx (8.1.3).
>=20
> I'm currently working on updating the dependency list in poky.yaml.in
> (and where this file is used), but would like to send this series first
> to have some feedback.

FWIW I'm really happy to see this getting sorted out! The patches seem
reasonable to me.

Cheers,

Richard

