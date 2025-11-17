Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC3D2CEBF96
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 13:16:43 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9033.1763385396039905318
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Nov 2025 05:16:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N16zWT2D;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8823e39c581so61005146d6.3
        for <docs@lists.yoctoproject.org>; Mon, 17 Nov 2025 05:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763385395; x=1763990195; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TdOZblPKQdjWuDqP6V0CktbQTuZVm8utKzWM5cIktmc=;
        b=N16zWT2DaojHY3v7du0nb5xQ79XEBhcA3y72z9PRp8YaaD+rrsqiDbVhAIdq1qht0x
         IvH4RK+GqXGPRGHn1c+Z5vecCx/AU1uX9tozKlVvLkIjLXYglGpDXbw6DOywDiLd2+s6
         U6LvsZIhlp5co4EIMg0aZY5g50hUDruxhu3+C0Kd2DX1Zssh81ZPdRCXlXaaRmxShWZu
         b1jIxJICpE/JBuUPaeRzIED/5gXH5MiPEDmIfTqT5zgIfhF2qPZVVkobCv5bv5N2beUO
         8IZwouYaxwC1MFzb8XxZ+pbOE/zD3pmN0JbWeprSfZ9S4P8Kz6jPOBrGxqUpramUOYBW
         OUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763385395; x=1763990195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdOZblPKQdjWuDqP6V0CktbQTuZVm8utKzWM5cIktmc=;
        b=pJjxQDcIxfQlcy2Vx5tdEiyEG+VH3eVro4KFrpjSWn7i/QIVr+nC9myxXtmKS11jQE
         30HFew5ApQK0ZeyKuWS0UXoiJhQGwqkH5Oett8ywUv887Xo64vP7qCLM6edAzDDPq1tC
         nhO0Ybn0FR9UcHI/nOzxaSO79EkpDmkV0/3L05e0VLuqPTflFvLUY3PicqZhKz3DEoZX
         bd26Z2YG6urtp1iIRe5QWx7iSh4DXlrkUAExITjFRNDMxFFxZbHZ9zQ+n4x5iK0WSq0x
         tH/c1pEK/HK2Tza6HQPnKLcUe/FRixj/wl0uiYS7B3lM5cvJyshhJB64UcSs0Lu15prt
         3x4g==
X-Forwarded-Encrypted: i=1; AJvYcCUesyh90QZGL5jHsv+FykYcCgD/bry1qYjKPc4f2Kq9ccIzBNygxF0dixrvoSRMJmdj2aip@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzxF87hXxUqaivTp5dbEcw54N7zCNPzCaV+Ote7H5tLDm2qzc2U
	6n7TjU6ZIzMqAQOccO3NHqEv0TWX08/dRyXT04EbD9ZPObq3ivjZibQh/KJMGT7TsKNTQ0xZyX5
	WBlbGWCC43O5x+40NDfnJ/iKQTEik5yY=
X-Gm-Gg: ASbGncssg19ZOkdSIAJWBDLsc3NobKvQKSKyjxAm5ZHbzgRXvGVgaSnFAFr24e7tFkv
	u5EvZHdyAKcW0YDvAhxemsDuugIOzdYFTdT/PNYcQCjbFCgJGgDJFRnO3IyZ/lzMrG7711s6K4Z
	2wvLtEQleR3f1DWWwIhcHRGxhm6XPOppNnGtq0gIsrmXa+Sn4Y5WXbeQhSaQSaa0vkQbV0oRM3i
	FkxQFPmP5i/LjN3YnOe8EJ7O8sLQMqfDlJuGKNsO5t0542d4nWAAsvZ+N5dDDUOdFeRPx5BsjM5
	herkUgOujYYomGTbQDua1evuOML/dWU6y7JFLXG+
X-Google-Smtp-Source: AGHT+IGDzZcndsT+IDhOjGp3dsFqCrn0r0EY8y3hRHcJAZoMidNqUWNG1hRvS7yIr8TYzxd2zLDlgj/dJ5Ygf7G1wmI=
X-Received: by 2002:a05:6214:19ca:b0:880:51f0:5b8a with SMTP id
 6a1803df08f44-882925e98e5mr162267386d6.15.1763385395044; Mon, 17 Nov 2025
 05:16:35 -0800 (PST)
MIME-Version: 1.0
References: <20251117-bitbake-setup-conf-updates-v3-0-46cdf826e79c@bootlin.com>
 <20251117-bitbake-setup-conf-updates-v3-1-46cdf826e79c@bootlin.com>
In-Reply-To: <20251117-bitbake-setup-conf-updates-v3-1-46cdf826e79c@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Nov 2025 14:16:23 +0100
X-Gm-Features: AWmQ_blyp92O0gytuRcH9BPipSLlDSEzyWe5dAK8UgXLl6TLoYYTT0Jlsycfkko
Message-ID: <CANNYZj-XZeTQYWFoar+odfYT0yhMCFi_-z_ETprQRDOqn7J8aA@mail.gmail.com>
Subject: Re: [docs] [PATCH v3 1/2] bitbake-setup: update: add a
 --update-bb-conf option
To: antonin.godard@bootlin.com
Cc: bitbake-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Nov 2025 13:16:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8067

On Mon, 17 Nov 2025 at 13:52, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
> +    update_bb_conf = 'prompt'
> +    try:
> +        update_bb_conf = args.update_bb_conf
> +    except AttributeError:
> +        # this arg is only passed from build_update()
> +        pass
> +
>      if config_diff:
>          print('\nConfiguration in {} has changed:\n{}'.format(setupdir, config_diff))
>          if update:
>              commit_config(confdir)
> -            update_build(new_upstream_config, confdir, setupdir, layerdir, d)
> +            update_build(new_upstream_config, confdir, setupdir, layerdir, d, update_bb_conf=update_bb_conf)
>          else:
>              bb.process.run('git -C {} restore config-upstream.json'.format(confdir))
>          return
>
>      if are_layers_changed(current_upstream_config["data"]["sources"], layerdir, d):
>          if update:
> -            update_build(current_upstream_config, confdir, setupdir, layerdir, d)
> +            update_build(current_upstream_config, confdir, setupdir, layerdir, d, update_bb_conf=update_bb_conf)
>          return

As both usages of update_bb_conf are guarded by 'update' variable
being true, and that guarantees that args.update_bb_conf exists, you
don't have to have that try..except block, and can pass in
args.update_bb_conf directly into update_build() ?

Other than that, looks fine!

Alex

