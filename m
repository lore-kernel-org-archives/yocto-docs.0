Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F887CE79BF
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:12:36 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.34258.1695204752393942628
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 03:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pi4vmNM2;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c022ce8114so31918141fa.1
        for <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 03:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695204750; x=1695809550; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XI7cK4zCji+qqssxO4Ps7Wt0UDAymqvlAJGBQy1qIk=;
        b=Pi4vmNM2g4KIq71HhPST4lSeBE2B33HoEkebcPTyI/jWBpPb3v17nN18fE+Ym2u1RG
         yX30ggmQSwd7egNj0SfW42irJfLVyE1FSKbBJV/Eax9mxgHtGmkdA20DUoH4XAsj466X
         yf4V6L2Ip48RMijK7JFp78pKa2zSz43HQwDARdxVqitB1k0gPPTNlzLnNovnKSjdXwce
         2mMMNng4W/mFBOKy2SmMd8jBCk6uXwnxMR2R3fE+F9XCeXHTByzy4M5F2AapJ9JhbzPH
         +HbMSUOIXdX7qAFL35oEQCHvLBeV6Bop66hDZVQG7NGq/7uO7VtWlbmNiSQ8rvBMsApG
         wCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695204750; x=1695809550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XI7cK4zCji+qqssxO4Ps7Wt0UDAymqvlAJGBQy1qIk=;
        b=WQTbN8Zkoja//zawLrW6+vgdkODxeolsUndpLY9bWKpFRRrlZ+5h3TCHJ7Vq78CeIj
         VTqSvZv1NcSrmvHo0vuz2u7qNLK98U0kcVf3TSTG2eyWqV1ypOUt+rzXOJNuxPluePzw
         CcICfTNP2wwpnu7K3jfSRKSmzkmQa2Wdr1THCd1qVMBFtH1hWHMjTSQ+EVjTxcgGdCBt
         NnQOP5QcHA93Nct95feqtdu8lceOGkbJN8R33/ZavqWAH4PXJlswU+yJKoJcCn9jCYSd
         ZouYcKj/lQMO5aKr9G6NKJ0v2F25EkHj4ZI6pHAgZPP+zeiIgCBYO5Fzp9VKodQhDeVR
         gkDA==
X-Gm-Message-State: AOJu0Yy3MmTD3dV4ZN19nvCcZe/htrtwJiYf3IwgJF/yVIWgUQVcBjPc
	GzQW+Au3EoKoWbRgR1XN29g1bKrueDtOSwBPV8U=
X-Google-Smtp-Source: AGHT+IFUGWYyJLVnuSYZQG14OZREOJ0Tci+jgZYNJxBAkni5XCZ7MvAAj8YkXupZuAUpj4HJQ5v1muOdeydfajX9HqY=
X-Received: by 2002:a2e:8912:0:b0:2bc:eb95:15c7 with SMTP id
 d18-20020a2e8912000000b002bceb9515c7mr1453584lji.49.1695204750382; Wed, 20
 Sep 2023 03:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230919125757.1571746-1-rhi@pengutronix.de> <20230919125757.1571746-2-rhi@pengutronix.de>
 <d3358ebb-5918-aaab-1a86-4236ce9b8854@bootlin.com> <CANNYZj9sEW_cBLppDmfkk+Hoo628G3WTiH9SBL3TY6iWcd9Nvg@mail.gmail.com>
 <4670f2e9-971a-3ced-3b5a-b551b1ba558f@bootlin.com> <CANNYZj-7C_DeNgVCyRuHRCXZNX-2JPcnysKLn7gQq8w-4aAkNA@mail.gmail.com>
 <20230920100944.2orm2thm5ekqsngt@pengutronix.de>
In-Reply-To: <20230920100944.2orm2thm5ekqsngt@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Sep 2023 12:12:19 +0200
Message-ID: <CANNYZj9g3L=XqBQTBkaHD9YWbYh1LY5e4on7Wf_GKuUUVMmV4g@mail.gmail.com>
Subject: Re: [docs] [RESEND] [PATCH] contributor-guide: add docs for
 Upstream-Status patch headers
To: Roland Hieber <rhi@pengutronix.de>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 10:12:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4269

On Wed, 20 Sept 2023 at 12:09, Roland Hieber <rhi@pengutronix.de> wrote:
> > We can notify about these changes outside of the docs list, but
> > otherwise as long as the language makes room for other options (e.g.
> > saying that there can be other reasons, but they must be clearly
> > explained) I don't think this is particularly controversial.
> >
> > We should also explain that Pending is something that should not be
> > misused as 'I can't be bother to submit upstream', and must have some
> > genuine obstacle to immediate upstream submission - just need to find
> > polite phrasing for that :)
>
> Ah =E2=80=93 just saw this mail after having sent out the patch series al=
ready.
> Feel free to leave that one out for now if more discussion is needed.I

If you can fold these two suggestions into the patch, I don't have any
other feedback and it can go in from my POV :)

Alex

