Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D781AC433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 17:33:06 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.313.1646847185250223257
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Mar 2022 09:33:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aqpgLYi/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 m42-20020a05600c3b2a00b00382ab337e14so3865838wms.3
        for <docs@lists.yoctoproject.org>;
 Wed, 09 Mar 2022 09:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=GxmmlyJV8U71sb7alCsJa+uVjm/MriHKASe94Los6jA=;
        b=aqpgLYi/0X+6wUkK0g5gS/O+UkzvypxZ/MftOP7yDb1Mp8tC+AV26v6JxHdQCYevht
         IS8Ban0lfHKGFfwkamwFtZceVD34bBKVVbca0YgzpkWEGNL/la9dLbgjwTmlf8YpJbS6
         08GvxDLZC5bBxqSY+DYTaeuVwV0Hq3rbNJMcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GxmmlyJV8U71sb7alCsJa+uVjm/MriHKASe94Los6jA=;
        b=AmPBZjQ52eQLrXF2QmRfEnmkX7wETyXb9JR+7iTrCub0aq8m39Ym5DpYU/vHmqoYUk
         rQbccSTGdpGRq0qopXY2dgdATnpwghWSORA0Pzi2lTPgoV1enXK2jhD0qfYiuxjQFotx
         DtVoFC41iqI3yEisolMJ3t3uhrUHCOiFkHrpCV42KN0nXJ7F+NyIbPXgTpcBd81coxRF
         ona9XPbpLTtuPBkbDTrzk/OFaYqo/l7uRWcwulpraCpbVX9pgqL8ICLbnZ7jm4tXuTcP
         puIZ5WAM6MxLzGceSclwwEoSLu6dmh+amgJKryRWtLRDYR97oc8KhUzM1fEiZ7odii/9
         h2gQ==
X-Gm-Message-State: AOAM533cO3kJTepPuKuiFr+x5JNyLGFXE6D3U7TXuvp6zDgJPvosSu/j
	sDmOdY9ZdcQPVbj9V+YemZxGgw==
X-Google-Smtp-Source: 
 ABdhPJySQTug0U00cdyqMzOtyJaHGCUjTKs4IKBd5aDsxCs1+aJ+opnV0qkvLTqNMfxcEl/oz3G36Q==
X-Received: by 2002:a05:600c:1908:b0:389:c3ca:9eac with SMTP id
 j8-20020a05600c190800b00389c3ca9eacmr357652wmq.182.1646847183687;
        Wed, 09 Mar 2022 09:33:03 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:32b1:4783:6b7d:78e6?
 ([2001:8b0:aba:5f3c:32b1:4783:6b7d:78e6])
        by smtp.gmail.com with ESMTPSA id
 r1-20020a5d4941000000b001ed89dcacbbsm2152836wrs.23.2022.03.09.09.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 09:33:03 -0800 (PST)
Message-ID: 
 <08a7766617e5541af2b721a5cbbcb55c7c3a93bd.camel@linuxfoundation.org>
Subject: Re: [docs] Time to make "branch" parameter mandatory in git
 SRC_URIs?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, BitBake developer list
	 <bitbake-devel@lists.openembedded.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Wed, 09 Mar 2022 17:33:02 +0000
In-Reply-To: <012f6398-a8dd-39fa-bb29-aeff10ab87c9@bootlin.com>
References: <012f6398-a8dd-39fa-bb29-aeff10ab87c9@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Mar 2022 17:33:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2563

On Wed, 2022-03-09 at 18:30 +0100, Michael Opdenacker via lists.yoctoproject.org
wrote:
> Hi Richard,
> 
> In the documentation (migration notes for 3.5), we say that the "branch"
> parameter is mandatory in git SRC_URIs.
> 
> However, that's not true yet in the code, which just issues a warning:
> https://git.openembedded.org/bitbake/tree/lib/bb/fetch2/git.py#n175
> 
> Given that the warning period was probably long enough, wouldn't it be
> time to align the code with the documentation ;-) ?
> 
> At least, this would make it easier for me to update the BitBake manual.

Lets just assume it mandatory for the docs since otherwise you do see warnings?

Cheers,

Richard


