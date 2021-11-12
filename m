Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CBA1C433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 17:17:58 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.86.1636737477235113453
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 09:17:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dm4GFd/l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id z200so8334018wmc.1
        for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 09:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=j7zR/N65tQyC6xvkytNSuOBhrOh5q+jzo+9lmCyRed0=;
        b=dm4GFd/lRI+HHhwQ61QFEyxX7L2e0FK1EcvF6+gGo8LZdtCDce0qa1qyTQzIxzQASq
         YfxCU3BIqtf99gdXBa9y3hySFLhKFfXN8+CjIyaq/+Oj4eAEa3tJpyRDbdxfxF9nzqnM
         e21+YLyK7feDpFAKEFylijwmaKQiH43BotZ1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=j7zR/N65tQyC6xvkytNSuOBhrOh5q+jzo+9lmCyRed0=;
        b=ykGtL7VnhMwAvZ/vIgSGZ/1p1g5jo7kOdUE5OFdSDD+s83gsBrTWjOqRs+dUT9RpeM
         EWev3DCofRpsGa9cDpHOrvj3f3CxglHC2N8cqsdxnyYovyizr0lW5G6MLf9XaE42+u0L
         wieOM+nhhSM8fPE5ntOEyimlA0BFvK8lFnVMNf6rBk0hwpeuqBGbQtPAyDFDbu6TpJ0O
         LJbZJKEtwLaFKi8vH318SIBC4dF13vPZl6hAHOnc1WyHpmqAQ3052s6trMHfcoPvHTUF
         yvlgIB1i5I9LCbATmewCoErVXAoLc1Ti1P4JeezJQov5rbxsdo8Y6ZxI9ZzOoXywPT2B
         gSPA==
X-Gm-Message-State: AOAM530NvxgpDrtdpvBPc7lCoiICZoceLZ2495o5y721Lbt+I0MMsl8B
	xd0zGfYcj/BrSONK6jwra/2GWg==
X-Google-Smtp-Source: 
 ABdhPJyvSYdPXSWVbxawEGzH1udEglPCOjkukTPqaWWUbH3b8nl2F1/bP7aodM0H93AKhEvmRf+uqA==
X-Received: by 2002:a05:600c:34c2:: with SMTP id
 d2mr19257074wmq.102.1636737475620;
        Fri, 12 Nov 2021 09:17:55 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c0bd:72b4:105a:2914?
 ([2001:8b0:aba:5f3c:c0bd:72b4:105a:2914])
        by smtp.gmail.com with ESMTPSA id
 r8sm8118892wrz.43.2021.11.12.09.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 09:17:55 -0800 (PST)
Message-ID: 
 <cb3ddc81dd08eda1e56906902a07e5034bd5a504.camel@linuxfoundation.org>
Subject: Re: [docs] Why "git send-email -M -1" in our contributing
 instructions?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, YP docs mailing
 list <docs@lists.yoctoproject.org>
Date: Fri, 12 Nov 2021 17:17:52 +0000
In-Reply-To: 
 <CANNYZj-L4jFf_4v2rV0tMkRpr-2_4ZrQzMyPXvU9BkYu_MRXeg@mail.gmail.com>
References: <84ac62a4-4e20-5453-47eb-994be2e11511@bootlin.com>
	 <8f1064b166e71dc88c99f702041a8f611929b9b5.camel@linuxfoundation.org>
	 <CANNYZj-L4jFf_4v2rV0tMkRpr-2_4ZrQzMyPXvU9BkYu_MRXeg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Nov 2021 17:17:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2145

On Fri, 2021-11-12 at 18:00 +0100, Alexander Kanavin wrote:
> There's no confusion. 'format-patch' writes a patch to disk, send-email
> formats a patch in the same way with the same options and sends it over email.
> We want rename detection in both.

I usually write to disk with format-patch, edit and then send. I'd forgotten the
send-email options are piped to format-patch...

Cheers,

Richard


