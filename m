Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5895DC433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:25:45 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.482.1634750744756303204
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 10:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=fluuXm/z;
 spf=pass (domain: foundries.io, ip: 209.85.221.46,
 mailfrom: daiane.angolini@foundries.io)
Received: by mail-wr1-f46.google.com with SMTP id k7so48242114wrd.13
        for <docs@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 10:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=nb7oMtOVqoyY+1KFWCyI3ES2kjFGxK6/MCN2JiLp/dQ=;
        b=fluuXm/zZgG2qN+NITKdbIP2kZpUJK8EwUWnhf2Y+FO4EbUcf51YshdXJREXJW7YFn
         SwLupJ6cxNLib6/ag08zNlsVhREnxOlPybNoZN7Ewq+4w0Im7YNoK/K47hPcyCuC0S+m
         OYz47eKvqHsFZ0N5/OKNK6XtV8bCjyx4EDiADhwiRqcy3s1jI3BDaYFFnNFFx6WTnNQs
         7ZFW77KDr9rFxQDM0InHLut3pPbg2xmGjjDg+XiFnXsbyJI/SgwU275HSPGeKd3q3hKR
         KUGa98zLlAK3aywqo2jDas+uBBf5cQhVal+frgbsEsNQhE73rnempuZvLgu5ALxzHnSI
         yn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=nb7oMtOVqoyY+1KFWCyI3ES2kjFGxK6/MCN2JiLp/dQ=;
        b=U1MIxk/javeWob187ggf3dHw4z5AqdTDSWMG4uO1x82QZBurAm7K/a568+2RAGhVEr
         xnzLcw8AwafKcwj5Qah+GrelLd4A0IpVdkLTI3L2B0IqpgDHKiPX40D2pZbXAhrbEvsk
         UojCSS6FfqOTcUWaQP9ULU06enfMOCRIH2noAhz9g3tUtuCV2CKAOQWpQrLKGnBoNQVv
         VpmlRTl320At1XNAtISHMKyeDKxUXmjRc5BDIUOhzPd1RFir0rj2KVrRBcNWjHPxRlaF
         S1KsPAbm9rgKhGT9ph88KyFNQrzyeYQu46XFPqgrEvBauqVqjQNs5W67BeQt3426wUcQ
         mmRQ==
X-Gm-Message-State: AOAM530BaLtx2gaoCMg/3eiMsbhyXY0sn8gzlSBdGc8LQ0jr6Gd5Gczm
	Iie7rzXNK2fMQ8CjGOSzQgq16aFgg4Grhhybr19JYqalqUTcSQ==
X-Google-Smtp-Source: 
 ABdhPJzfLfhjU7J9PpxcwvjkAN3NDtSaUDsFfO2TFxjLxYuwB+6JNQThp+D+Tl6BX5oZrjzu75/LZhc5yT8k7cE8W/0=
X-Received: by 2002:adf:bb81:: with SMTP id q1mr656834wrg.119.1634750742768;
 Wed, 20 Oct 2021 10:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <16AFCC10F2844E5D.10624@lists.yoctoproject.org>
In-Reply-To: <16AFCC10F2844E5D.10624@lists.yoctoproject.org>
From: Daiane Angolini <daiane.angolini@foundries.io>
Date: Wed, 20 Oct 2021 14:25:31 -0300
Message-ID: 
 <CA+HEL7-2J1mkD_9JAv+-b+Ydr6U=b=nUemJn1SN4O4RLu9E3EQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: Update how to set a useradd password
To: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Oct 2021 17:25:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2015

Hi

I am not completely sure of some details on this patch. Any
suggestions to make it better, please let me know.

There is a bug [1] and the commit which changed this behavior is [2]

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=14605
[2] http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-extended/shadow?id=759df7395908f18b3b68f28d043ac9ebd42dd0c8

Regards,
Daiane

On Wed, Oct 20, 2021 at 2:06 PM Daiane Angolini via
lists.yoctoproject.org
<daiane.angolini=foundries.io@lists.yoctoproject.org> wrote:
>
> Partial fix for [YOCTO 14605]
>
> Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
> ---
>  documentation/ref-manual/classes.rst | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index ffaad9bfc..b09f83b28 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -590,19 +590,25 @@ Here is an example that uses this class in an image recipe::
>         "
>
>  Here is an example that adds two users named "tester-jim" and "tester-sue" and assigns
> -passwords::
> +passwords. First on host, create the password hash::
> +
> +   mkpasswd -m sha512crypt tester01
> +
> +The resultant hash is set to a variable and used in ``useradd`` command parameters.
> +Remember to escape the character ``$``::
>
>     inherit extrausers
> +   PASSWD = "\$6\$kt.uxYMp9O9.Yxqd\$SBaJTucixmPm7/WjFL2CjUGMHTqtw8KPK0yxpYw.tGWWHlnOwkUwZ0Pa6vR724Te/E5./V.wua4HT/h0li8Lw/"
>     EXTRA_USERS_PARAMS = "\
> -       useradd -P tester01 tester-jim; \
> -       useradd -P tester01 tester-sue; \
> +       useradd -p '${PASSWD} tester-jim; \
> +       useradd -p '${PASSWD} tester-sue; \
>         "
>
> -Finally, here is an example that sets the root password to "1876*18"::
> +Finally, here is an example that sets the root password::
>
>     inherit extrausers
>     EXTRA_USERS_PARAMS = "\
> -       usermod -P 1876*18 root; \
> +       usermod -p '${PASSWD} root; \
>         "
>
>  .. _ref-classes-features_check:
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2014): https://lists.yoctoproject.org/g/docs/message/2014
> Mute This Topic: https://lists.yoctoproject.org/mt/86470322/5992125
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [daiane.angolini@foundries.io]
> -=-=-=-=-=-=-=-=-=-=-=-
>

