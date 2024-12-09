Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475A3E7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 16:10:23 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.105551.1733760615739245702
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 08:10:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VfckNw4D;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d8a3e99e32so36151276d6.2
        for <docs@lists.yoctoproject.org>; Mon, 09 Dec 2024 08:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733760615; x=1734365415; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/DLxXlP4Ic2dJQe7+BQkOPXcGfa6kRfiM7rcMyWGM8Q=;
        b=VfckNw4DgSoLWhxRI70E9PLslPbz3+589PUSejPO1lyp7BTDNDUXqtiCtFL/fJQUwd
         fCDc7hlbVBu9+rANiaDRfXEywZcZWEsIFwiGkWcn5rsRd9rFcN5vIZT2sWvU3Tm9EFgw
         iSFOsPqkDf9TiRjooyKN/z01txZPfXwT8boLfv6X4q5MNgk3C80JSeG7FZt6X8axENfZ
         1BCawRXQ9hSB8KtUPma8bcqPH+7O+3tRQ34eIUpWNvn4a7NEHwSWFOuWjdHd/jyUwyhE
         VOLrL1NfzGpq/1m8esU6rFBRfJXmoBK8/ivpAxS6j6FcDTY5m6vTpY4SZqrDlEZW3Ue4
         WEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733760615; x=1734365415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DLxXlP4Ic2dJQe7+BQkOPXcGfa6kRfiM7rcMyWGM8Q=;
        b=SFOBvS/ZVJp6QR2mrW03YiTFOcvYQ88sCemMHqnIkDZPvnnUhk0tbDm6vEppsX/6H/
         uMS1VHll6dA6mkUJrv8lJ09AqS0J2W/W73iMWZpdFW/kvtTdG8M7JglaSHKjLcb+uK+F
         JO3S9MIPkhwFYrQlmtX2KelrFDrl5O6kyyXKjP0zW277A1gZ6m3wJmvUwX0gqBAdzKxZ
         ne1betNww9xL2PGTL3/21r8FM8trxYf+YEKD7hmXy0wOHhRu6pl5tNuuchKT2doHc6ls
         9jBagW5cXQoTPi0uUrJtb7DMdywOO/0BsF4NF96L1kzgHE2/gsGorW2NYn6n0JtLWZAP
         SjOg==
X-Forwarded-Encrypted: i=1; AJvYcCXyhUrFJlhffoF95/YXLzBkcujeTyw8ZjgVN4cyAr7xICT280JEnBb++PsfRHDAAtIt+uk3@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxHyBjO7xu+eUMEwEViEKgGoJVAiGssE8eeuA0nkFeJBNFtPRzc
	Desq4FlhubNlZyR+VWvJhZm6w6ROzVvYIiID2vD7eGBmOB430+N4eGMVuSl2eLi4BARdqRBjnGQ
	AYhRnmJsHkZLABjbrQk+YfEh19Ec=
X-Gm-Gg: ASbGncsvk3tMCM6ystz3ZRMPCKkBwfdwkAzaPnMNhdnbX/1q+i0wJgrlJo3Wy0Tvo4t
	C/rxrfL7Dn6xEfnP8LEnSzQCgVznOrdiVum8Xnldq0DT4f2oadUUiOoAlMKeUP6k4vg==
X-Google-Smtp-Source: AGHT+IEqad66cydCDPdfMwLkoHjATLnUUunmXvfi/9luy1ei9XTy8G17sdOD7xO6XtuHcuHvaN8ZXy021PEaVoJzylQ=
X-Received: by 2002:a05:6214:20e8:b0:6d8:9832:75d0 with SMTP id
 6a1803df08f44-6d91e3747a5mr15952726d6.17.1733760614793; Mon, 09 Dec 2024
 08:10:14 -0800 (PST)
MIME-Version: 1.0
References: <20241209133053.2494088-1-alex.kanavin@gmail.com>
 <e0d3f4c1-f252-44f4-9e45-dbfa13b41996@cherry.de> <CANNYZj-LziSwSdKMCTkRQgwzHBM_TFoZhkKbx9Tvcf943zBS8Q@mail.gmail.com>
 <36c6cab2-e348-4ad6-9ceb-4692f177aeef@cherry.de>
In-Reply-To: <36c6cab2-e348-4ad6-9ceb-4692f177aeef@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Dec 2024 17:10:03 +0100
Message-ID: <CANNYZj_78AvkfB+ENKbXThD+rR6B_Ek+JkaOU+ayJtixDu9E7w@mail.gmail.com>
Subject: Re: [docs] [bitbake-devel] [PATCH] bitbake-user-manual-metadata: add
 a section about 'addfragments`
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 09 Dec 2024 16:10:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5900

On Mon, 9 Dec 2024 at 16:50, Quentin Schulz <quentin.schulz@cherry.de> wrote:
> I'm suggesting to make the explanation a bit more thorough about what
> the "path prefix" actually is. My understanding is that it is the path
> relative to the root of any layer, i.e. relative to any LAYER_DIR.

I sent a v2. If you think further explanation for addfragment
parameters is needed, please be specific, and send followup patches.

> This answers the question of "where should I put my fragment in my own
> layer so it can be used with addfragments directive". I could have a
> repo with multiple layers for example, where do I put it? Is it impacted
> by BBPATH?

You place it in a layer which would be the most appropriate for the
fragment, considering its functionality. You can have any amount of
nested categories, as long as its subdirectories under conf/fragments
(or whatever location addfragments prescribes).

It isn't affected by BBPATH because the constructed paths to 'require'
are absolute from / on the build machine.

> Can't we have nice things in the BitBake docs as well? It is technically
> usable on its own without OE-Core even.

Technically, yes, it's usable without oe-core, and it can also be
placed elsewhere than bitbake.conf.

But I do not see a use case for either, and won't try to invent one in
a hand-wavy way. And so I'm describing the syntax, and only the
syntax, and leaving it at that. Actual instructions about using the
fragments are very much oe-core specific, and will be placed in
respective manuals. Including about where to place the fragment, and
how BBPATH is not involved and so on.

Alex

