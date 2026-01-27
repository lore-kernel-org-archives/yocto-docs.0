Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FDFD2D8E6
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 10:19:08 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7622.1769509140966587271
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 02:19:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DAAP/WbN;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8c5386f1c9fso785089985a.1
        for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 02:19:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769509140; cv=none;
        d=google.com; s=arc-20240605;
        b=eUE2U3E2IHHAPN8m4qhgkJyCMI07TIvhrQqg3RZSzPzi0TLm7fHSKvGSHTPWhPZZHy
         +zcRkXC0Ccm6JwgbMRyo7Gg/3KsRVbx+ZzeD/FbVpHyKtdEs+NR6rCLewYMG3kIF4t7I
         FOPDOby4jKeq9xI1IESB3krfgWcA5wLR/HsSVmkRYZYumMqbJVKdBBlePkMrW6I0hOT8
         xwmZsMqKoInmtp9KZarVHFXWHUReWoRpjCOpdUHr2VL9GVARABNPtryvw+0X7W2viwc4
         OKhBvFjdVkJG5cSuhUF1V8pisg+O9UXsBNWefrmEXCZuKrj2GpIinZZXZciTct9O2oc1
         Hteg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7uwuUyCiDsaB+YMKwFWZX+6GIb3Jhr1HsPuzDrGDRH8=;
        fh=W4Rw0ZQ06f8Kwxuc5Byo3KI51uuxOmPqUWpTiPLUNPI=;
        b=Q7umoHnHdwVMcFEE9oPh7ZBcW0iE8AD8wMbgwJ/jk9Hj0/UOdGn6Xt5eb3lFQb7L8X
         zCGWD2gTzEHgSov2OHvQQCD3CXQ3ettuute97t5aqxwlt/So7xZghnvRTiXMgcXa9NSO
         tvlxe4pg8oX6JxObbDyZ14zrDUBQl5T56M4jVtq4cyRmGLrjWO/b7rwZydwUVcvG/vrJ
         ZoBmb/Nz6vWB4effBlnxIrDVegufUHsmRl/wDHRCXp0kfWFu4DTz0peS7idSAgR3tD0a
         llaXq20QlwnBBgL1AdBn2pFeQHnziBoHMGgJGQrm+QJ5r58pC3Km0a9r/i5LW5yaK48B
         UKUA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769509140; x=1770113940; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7uwuUyCiDsaB+YMKwFWZX+6GIb3Jhr1HsPuzDrGDRH8=;
        b=DAAP/WbN0Txj5wi7EsGmw8beJiIIbdNY0YkniHGctYnmcqywpU/Xhz1j0lNrCZfB4m
         Ur02c4kudOFlnJbzOfyXyhrfUPtvNZWdSAF7Q6dMAabOoE8kECf2GJtR6q947EAcxkON
         vmh2A7wFoIVwivg3vq1vGvQv7l5fcROCE5bYBjwGLSIc5lQm202ZOk3TjlAD+1xkrEQk
         Nu4ydvbTbUJXXcS7WbV0VqBSdLPaAdfaOIMvazvU8/oZLX9mFTslgjzjvNG+nTU1XsCE
         9t3929nraRc82gZQPweeEuHoLrxH5QIwsBirLhbGg4iUxXdMHgwSFlVdE1VdGtuBjNtV
         xGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769509140; x=1770113940;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uwuUyCiDsaB+YMKwFWZX+6GIb3Jhr1HsPuzDrGDRH8=;
        b=Be9kzl5mEXfe3AJvQZZZ+ZWyEa0NgqMfS+y5URDDnu46R+Z/w+lromeubBpLKUnXic
         kuP+fSeIfnkNSxstnp6xfYC6+/k83a9B0xNM0QTxAO/vZ5rIF2DYqiYUDemAWg8BX/qM
         iZW0zJC2O0tPb/83e40q297yY+hUoqyDdmJhwHjuzE4+NbmfdncGWMUTSmbYuSd4Inj5
         nZXbmt92u6DrF/6r73+KcbCQz2BTxZIF4Acr9QVdotugKX7DzM6Z1+FNzUXibgt7mcyg
         1l/DtZcamz6UdljdGmHmJkq/ZoRnu7gR9HwSWNf9C/eZEAv8H+c++znIyllaRtfDtqew
         xHvA==
X-Forwarded-Encrypted: i=1; AJvYcCXEZubccYYzNMlcV1hNnUrbmvI253rD3GgpDt/WhaB2RKECdWIhnokJEZSmhxLGEErXvPn6@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yz2GJyBcHCCnVj3gs/ZvqyYNCDjUAY5hwvEdBi3+0LHJ1vPO61Z
	7fJzd54TsDDm7JMajB4I5UAf0riydP4MAWlDfuPZfMmDhR0rpnLYjJ6dE15Cepwo8b4CAKtDS+y
	KZEoA+oMg0dbuPNfd7m2RNxcFqh9o7oQ=
X-Gm-Gg: AZuq6aLDpM4tofX6+H7s4bLNAymr8QQ2/zJjUxNu7w2M8EElOfjZShiyCIfcg5BmU19
	8U8Ax3HCXj53hevCxEw0tRFG9Uz8zVUbhSVFs4zyt7heNnQ/NHoS+SeuBsioNKrCHf8V8r7wFmr
	7+FSRQg7zLBtDeiirmbfPg7Fpanhlpn6fL1Kv78E8iw2ebeuLRyFrI+du1weJLPMoiLXWNzbxPf
	ljl3ynSS76/RsYrk7CHgGzSrS+o4WXsV5DNCqlIhbfaawH73gZZ1VgqzOrb1ea9zItoMGZQ1RUV
	+ZG7dqKmx+L+3Af3O72Ti25Xf7wlqw==
X-Received: by 2002:a05:620a:3190:b0:8c6:a8a6:e164 with SMTP id
 af79cd13be357-8c70b8fb2aamr137486385a.45.1769509139968; Tue, 27 Jan 2026
 02:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20260126222743.411405-1-daiane.angolini@foundries.io>
In-Reply-To: <20260126222743.411405-1-daiane.angolini@foundries.io>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Jan 2026 11:18:48 +0100
X-Gm-Features: AZwV_QgbHdMcPvIK5m7YPWGvCET2ogpIJGLKoWWiYCORslr8EsRG2D_CcYCJFgc
Message-ID: <CANNYZj_mFfO-cw9KO9u4wkC4qUrEgAP-kA1YEYLeabuZ=mg5oQ@mail.gmail.com>
Subject: Re: [docs][PATCH 1/5] doc: change some terminology around bitbake-setup
To: daiane.angolini@foundries.io
Cc: bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 10:19:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8718

On Mon, 26 Jan 2026 at 23:28, Daiane Angolini via
lists.yoctoproject.org
<daiane.angolini=foundries.io@lists.yoctoproject.org> wrote:
> Change some terms to use more specific wording:
>
>   Generic Configuration  -> BitBake Setup Template
>   Specific Configuration -> BitBake Setup Instance

I believe the consensus was to retain the word 'configuration'. E.g

'generic configuration' -> 'configuration template'
'specific configuration' -> 'configuration instance'

From the context (bitbake-setup docs, bitbake-setup output) it should
be obvious that it's bitbake-setup configurations, so I guess it
doesn't need to be prefixed.

Alex

