Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FF5D41C09
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 08:51:21 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5031.1765443075471118758
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 00:51:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z8qaRTTA;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8823e39c581so10342196d6.3
        for <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 00:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765443074; x=1766047874; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BjcTBvDNAD6mjDRaVbeRzMUALtu/uTxifrB8sD4KmY0=;
        b=Z8qaRTTAFQknWMMKkqu0poBNXP93ItbtZL2lhS/AjqrEdCaAA64cL03LcBGSyV6wli
         blt7ovUGYCSdzi6QGnoNEtaRljH+foIMRT++tattqgrNBS6KeEvZnQF6FBi1LDXwyv49
         6GllFxJwoOiAyBjalahNT3h+t1GNZENFwqHodD7ZjT4m/dCXqHHdLIP1dN6ixa0+8dNi
         G75j/L77F8jaeihwmictME5LIV8U3wwqdsvGT05IKH7SoCecUrkHjrA8xE0FTr2WmZnm
         Vle/k93CWJ+uN6pc6KqU4w+c+D0MMRajXbqoB7TjF6OiQM5oR30QlLvG7H6ATn/jeaZD
         TL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765443074; x=1766047874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjcTBvDNAD6mjDRaVbeRzMUALtu/uTxifrB8sD4KmY0=;
        b=lhxuGhxrIBUu9xJ5VZCSNTVdFsrZEr0+b1s8e22bcSAx8hFERkqzgttUCwgTW4DcQc
         DcZqI2T5y7Z9cudzs2cUt6fF8L1WGdCOloK5FYW+p4XoADc30JS+maKf4NpVfbMdbWNr
         czB/ihHMkmSLpB4ilO/bk5QgitOYj+E3OIU6NW/Mony46LiNX94/rUeOYM8rWARMldXY
         Qn3gpXxd1XBZ02NAXJKRVFXs4K5F+VlHxVA0X8k+vl+EYi51lcQsqAUPL0renrYRd2ot
         QpFf7D+3YLD5iDyyt+zhYbpqwFnFs8FZA/JXUBRw+QS9u9aL2SgxWU1zcWgXQK3PP6D4
         xMPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwNHOarP0YOeLpRaUWbJ+ERc+loPD+PjgCrAJ4s5AQTXDE2tcdirKl4wXoy8QUeaBF5PT1@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxfkeFLFfzKdFumTvi0j75pO7baCZUuvPH2w0WjBNNfKNjTNjEk
	yf11CUbe4nZ9O2VXHLfQFH2RQV1fvyR48l9v3CNFg7pku/RaPsO+MOoTX9q3hFILVh15QTNysib
	jv/kFLsQZ09svLM2wepV16OQvmaV+f7o=
X-Gm-Gg: AY/fxX5A4lRk53r+Cj+fN1TpzPiPCaPXhMzuwC2c+9HtmG4z9d3u/kTkqZvPEsMz8r8
	EKCiBQvKCiLQo5thF0C4EYunS6Kjpm8DtDnUbsXpl4mYEy2o5ixf1DUOoCB710IcINGQgOvbtyS
	UABJXSrQ4EF3vcJl/r1lYudCMmdHrrC/PbN76OHp/RBqIyJxtiOUNout6H4HnnaR8WkqI6PWfbX
	J4UY+zCiQbzBDQ+ffpcyxNTmG2L4IpH5X0QdrMU2nzFGipaATElIPZS6CY0W+Pqu/1tPSXiLINA
	N0+S0FKsJY69+bZnskipDAwRyDs9vw==
X-Google-Smtp-Source: AGHT+IG2W2hQ5TkkJ1AtyYWznA3wy5vlvjGMrrIaGK85qRQkky/f2uuU+DrZoovobB2UXggCef5OYTFZR5rpgCvbl0s=
X-Received: by 2002:a05:6214:5003:b0:880:47e0:19e8 with SMTP id
 6a1803df08f44-88863aa6662mr82601186d6.42.1765443074394; Thu, 11 Dec 2025
 00:51:14 -0800 (PST)
MIME-Version: 1.0
References: <20251205234033.6363-1-swami310@gmail.com> <CA+-_CqnqT4roapfisF_6gt2P-OJ8gkw9GvRNEnWh9FQX6HU7Sw@mail.gmail.com>
 <CAMSfU+5enXOdO03=d2Nfx6infFOoema2Y7xQG9VErNN1DgbE9A@mail.gmail.com>
In-Reply-To: <CAMSfU+5enXOdO03=d2Nfx6infFOoema2Y7xQG9VErNN1DgbE9A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Dec 2025 09:51:02 +0100
X-Gm-Features: AQt7F2riJGGlUR-ojK6oEpqmIxAhOHBJbgQc3otRcgSeR3T_Kz7u1OO7DWivJfM
Message-ID: <CANNYZj_a=DgXvyRRr8igP6HLee819-DKfjTnWd8WHu9Fs5Wv9A@mail.gmail.com>
Subject: Re: [bitbake-devel] [PATCH v7] bitbake-user-manual: Document BB_CMDLINE
To: yoann.congal@smile.fr
Cc: swami310@gmail.com, bitbake-devel@lists.openembedded.org, 
	docs@lists.yoctoproject.org, michael.opdenacker@rootcommit.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 08:51:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8240

On Thu, 11 Dec 2025 at 08:50, Yoann Congal via lists.openembedded.org
<yoann.congal=smile.fr@lists.openembedded.org> wrote:
> > I have not heard anything after I submitted Patch V7. Is it accepted ?  How can I know the latest status ?
> > Please help me understand.
>
> Your patch is in the master-next branch :
> https://git.openembedded.org/bitbake/log/?h=master-next
>
> Which means it has been selected for review and tests. Once those
> happen you will either receive a review by mail or see your patch get
> merged on master.
> Merges usually happen after the patch review calls (which are on
> monday and thursday :
> https://www.yoctoproject.org/community/get-involved/).
> Ping back if nothing happens in a week or so.

While the process description is correct, all of this has already
happened, and the patch landed in master some days ago. Which can be
seen in the link above! It's just that master and master-next are the
same at the moment.

There are no separate notifications for when patches are accepted, you
just need to check the upstream branches, either get the latest
commits with git locally, or look at the commit log in a browser.

Alex

