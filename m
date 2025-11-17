Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E2FCEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 11:52:53 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7662.1763380370908376062
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Nov 2025 03:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OYXzYdlO;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-880570bdef8so41028616d6.3
        for <docs@lists.yoctoproject.org>; Mon, 17 Nov 2025 03:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763380370; x=1763985170; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0OKncnFIm3zgJ+IeY2cJjF9l0J+9dbsiQbuxG2esbdM=;
        b=OYXzYdlO0XHqdf48x/1j7LVZGDU+gaQmvxLkDQlNt3w0oGlw/fc93ln+82vTVClPVn
         OGrkiYReno1X7POZvIN5WjyVy1ttFkQZzn4bQin/Zq8wVwcyS4ZpE9ffEjk8EuSWsCz3
         DFDRpBo0d/qUuvCNjB0ok+b9ZCSdT4mxwIbOinR7E4uOOErKt1kku/+IGrvhnFpN8EH3
         JhTL6I/0qDySnR/nzmA9kLmNOi2pV7Q2Wof3F6c585EBU3oUtbzrBxwwJ2UltzVi93if
         VkvptOHMHkrFjJvxQpmeVngr23286FkqmquhWTrk+DH6/7lSZiFPJCVPb763iprR/T+O
         IUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763380370; x=1763985170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OKncnFIm3zgJ+IeY2cJjF9l0J+9dbsiQbuxG2esbdM=;
        b=blLW2ZWtgiZeNTEYP9xsfTvdRxVClrTmpjgw0mq2K1/bPgA2SU+F637uOCI8ExeCJ/
         C7yaUR5uix7yTdGNpTFPy+9D2SOBorO/PwxiMaQbG4G95FSpgsxi4pkVwWfKO1nCdexq
         WqK1hcLye9Hou8UB51re52fkD625S3orOE6PzOxt38uIPln6WDPHK0lsqBTUofWTYpfD
         JbF8MHD319XILJloydag2IAefIWXnXbut6egv2AD2AkXML6JCjaoWmeDDE19nHT7Oj+o
         AUG7Yg27tex9zffQetm/Yd90eHaeM8htVcXQFJ+1mTk7X33zzA7SJ6FJkN2t0rqZWnF2
         /bbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtscnQ9V/TgMcOlicVELiuSaccy8vKDKkkHZ72y3TWYLrCcnWr1rfa8Wad7DXLva+VBG8S@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwHyUIPmqntb0lmgseyqDNKGFAJhVtpSi5Jp+RJ0LcPndq1UmOV
	Giaig5qSPO847G3X3k7jHzJX9dERTAmU0V0zVlsiaiuilGZ1o0RXKfQieY9liUT7Z0bAnk7ag0R
	rt7ls9i6E0lMBIJgUgy43VtG6qbusIE8=
X-Gm-Gg: ASbGnculxXgHHXWye/McwxxfiRYr0oEn1/BkMP7oTaw43lHxxbxeom9GqLIYGFxs6xj
	EI099zhTI3ugP4M8/JrZgp4aXznxTF2v0lkUDO5YO1qpA3VRCtXxVd4LArDDgYELpXpZDwbGNYc
	rTSfnhlqpmPW8v8c1+bYhU40V8o8z7Ml5ZuoR7Z2DGlaDE8TCpeYWRl2VgxtKWujWwr5ehH8otp
	Go0R2CGdCNMt5SP3KiuP2Va145jfvdnspmZdyM4W0Sf8kHBmz9CHAHQMR9pQ6mCCvNvTH16mcOq
	n5WVLDdbyutAJy/6sHAGXQAWj6AYg2BOMB8hqZSY
X-Google-Smtp-Source: AGHT+IHkCZrF7HZXdBmA8gLirEFzytKQ9zOAPtSYVWIJLB7hNUwyuEiDGjODqK8frZOrQM5vGb9asovWwy/eHYNpFtA=
X-Received: by 2002:a05:6214:410f:b0:87c:28cc:9e69 with SMTP id
 6a1803df08f44-882926af38dmr162119946d6.55.1763380369835; Mon, 17 Nov 2025
 03:52:49 -0800 (PST)
MIME-Version: 1.0
References: <20251117-bitbake-setup-conf-updates-v2-0-209637e01fbe@bootlin.com>
 <20251117-bitbake-setup-conf-updates-v2-1-209637e01fbe@bootlin.com>
In-Reply-To: <20251117-bitbake-setup-conf-updates-v2-1-209637e01fbe@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Nov 2025 12:52:38 +0100
X-Gm-Features: AWmQ_bkAo5OszNiz7q_LSiw0MXSiIu1eHUXu53NzJBCJikbfi9EZda3qPl2BKpI
Message-ID: <CANNYZj9SDzt_LoR2fjENeYrmBUjjquQ=kQvoawp0HXLxkKRgwQ@mail.gmail.com>
Subject: Re: [docs] [PATCH v2 1/2] bitbake-setup: update: add a
 --update-bb-conf option
To: antonin.godard@bootlin.com
Cc: bitbake-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Nov 2025 11:52:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8060

On Mon, 17 Nov 2025 at 09:21, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
> -        bitbake_config_diff = get_diff(backup_bitbake_confdir, bitbake_confdir)

... replaced by:

> +        try:
> +            conf_diff = bb.process.run(f'git diff --no-index "{backup_bitbake_confdir}" "{bitbake_confdir}"')[0]
> +        except bb.process.ExecutionError as e:
> +            if e.exitcode == 1:
> +                conf_diff = e.stdout
> +            else:
> +                raise e

Why? I think the function helper should be reused to keep the main
code more succinct.

> +    _extra_msg_info = " (--update-bb-conf=yes)"

I'd say it's better to print appropriate messages directly in the
logic branches (even if they differ only slightly), rather than set
and tweak a variable.

> +    if update_bb_conf == "no":
> +        print('Ignoring upstream bitbake configuration changes (--update-bb-conf=no)')
> +        print(f'Leaving the upstream configuration in {upstream_bitbake_confdir}')
> +        os.rename(bitbake_confdir, upstream_bitbake_confdir)
> +        os.rename(backup_bitbake_confdir, bitbake_confdir)
> +    elif conf_diff:

The first check should be if bitbake configuration has changed at all,
and the new config should be removed if so.

See the proposal here:
https://lists.yoctoproject.org/g/docs/message/8056

So the overall logic should be:

if os.path.exists(backup_bitbake_confdir):
    ... (obtain the diff)
    if not conf_diff:
        print("New bitbake configuration from upstream is the same as
the old one, no need to update it.")
        os.rmtree(new)
        os.rename(backup, main)
        return
    else:
       print('Upstream bitbake configuration changes were found:')
       print(conf_diff)
       if update_bb_conf == 'prompt':
          ... ask for yes or no

    if update_bb_conf == 'no':
       ... (the block quoted above)
       return

... (write readme and print instructions and notice where the old config is)


>  def build_update(top_dir, settings, args, d):
> -    build_status(top_dir, settings, args, d, update=True)
> +    build_status(top_dir, settings, args, d, update=True, update_bb_conf=args.update_bb_conf)

args are already passed in, so no need to pass args.update_bb_conf as
a separate argument. build_status() can just obtain it from args.

Alex

