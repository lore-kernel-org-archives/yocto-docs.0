Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A242C433F5
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 14:05:47 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.40674.1639577146046949784
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 06:05:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HtQ4iv92;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id k9so20616038wrd.2
        for <docs@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 06:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wx9IH+Ejf5Goj/eAIFnjKXUAgrVXgnn0IWsmMyGy5/g=;
        b=HtQ4iv92n2Ybu9ZuP7T41c9lDWMyiaMJH6XIfUkwx0D8qWRbK8EmzmnD5MNKNDelFC
         IXCo6BNsaekzgqtbLQdCUi9M8fbJDHUmYOrIoEVtrycRmKqu24SBGqubchIA2hLvYnCS
         QkT47+7p1sGIVeUKgd/onbmtNHa4kEeBPzwgDTdWioBT6meYSxOdiLZf0mpz03CR+8i/
         yjljsRf6YyutxY662swpHyZvHObd80S40ALB5dq/PKuIap3Q59o4HJ58hOW5mvPe/zR/
         653L7IcUwjOdQ1f9iOD1ctCtJjhvjn8DTTuQqI/D8XD0y/Gj2+2MhFeZ4dyUfWcDa/uM
         33ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wx9IH+Ejf5Goj/eAIFnjKXUAgrVXgnn0IWsmMyGy5/g=;
        b=UPPmGkQSYmsPlj1i+cJXoW+IkOrsN4dWtuwysmu/PYmiHUfGtchWXtlMtfAhVcDYbj
         R/ceOTwGAWZPViPZIURLG7y+sQJyACGHtQq/bWWKB6Q8yc6zpDTv4tvBh4YzTqdkM1D4
         gi7/bm80NA2FAp65T2hAo+BLhUkH7m+1qEo5V7DmH7nDTaEv2XqZi9eYIfTSNCyhB2lz
         9Dh4wg4YtDtf+IF1NPbWPcNQi8FQGOmAFoJ2W1lL4kGCH9LyUGRfwBxbV8YosvV61DU+
         soif0BDErm/GfPBwkmHDijblCktD1YXMmhvGvDmSXyRSxbuBY/umeo9yzHgP3Q4eya+d
         ewug==
X-Gm-Message-State: AOAM530QpN32jScJvk2sHMN4bsWBiGVg7X205Vcc8tH0Nv4/RpJ35lo5
	GlhHvDVA+B3HkMlzrJ0v+QB8WJhCjt/aOLJpP5U=
X-Google-Smtp-Source: 
 ABdhPJxX7xC5oPd/o+xSZxq3++WNYRBVQ6Rjj7KItEjAlcBr62TjWZJ6wxzLc/fLafwPSjCeOqPowg1QlPj441ngQpg=
X-Received: by 2002:adf:fbd0:: with SMTP id d16mr4518690wrs.107.1639577144401;
 Wed, 15 Dec 2021 06:05:44 -0800 (PST)
MIME-Version: 1.0
References: <9234471a-8cb1-429a-0dd9-6820cdf62616@bootlin.com>
 <CAJdd5GbRMTVhm9rZHOEmX3a-14cZsby_RuAX2SRjhv6cvvAq9w@mail.gmail.com>
 <d19f9e73-929f-d32e-ef57-6e48950c1b20@bootlin.com>
In-Reply-To: <d19f9e73-929f-d32e-ef57-6e48950c1b20@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 15 Dec 2021 08:05:33 -0600
Message-ID: 
 <CAJdd5GY8fcTyseZ6KfcN+WkFG-WjfpDFEyy=F44UUFFj2C70hA@mail.gmail.com>
Subject: Re: [bitbake-devel] [docs] Can BB_HASHSERVE still take a 'host:port'
 value?
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>,
	BitBake developer list <bitbake-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Dec 2021 14:05:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2270

On Wed, Dec 15, 2021 at 8:00 AM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Joshua,
>
> On 12/14/21 11:11 PM, Joshua Watt wrote:
> > On Tue, Dec 14, 2021 at 2:54 PM Michael Opdenacker
> > <michael.opdenacker@bootlin.com> wrote:
> >> Greetings,
> >>
> >> I'm trying to propose more details and updates to the documentation
> >> about the Hash Equivalence topic.
> >>
> >> Looking at the code, especially at
> >> https://git.openembedded.org/bitbake/tree/lib/bb/cooker.py#n387, I'm
> >> wondering whether BB_HASHSERVE can still take a 'host:port' value as the
> >> current BitBake documentation says.
> >>
> >> From what I've read so far, it seems to me that if BB_HASHSERVE ==
> >> "auto", a local server is started using a UNIX socket, possibly tied to
> >> a remote upstream server specified through BB_HASHSERVE_UPSTREAM.
> >>
> >> The other pieces of code where I found BB_HASHSERVE don't seem to show
> >> any use of a 'host:port' value either.
> > BB_HASHSERVE can be one of:
> >  1) "auto" to automatically start a local hash server, optionally
> > using BB_HASHSERVE_UPSTREAM as the upstream
> >  2) HOST:PORT to connect to an existing hash server over TCP
> >  3) unix://PATH to connect to an existing hash server over a UNIX domain socket
>
>
> Thanks for confirming this.
> However, when BB_HASHSERVE is set to "HOST:PORT", may I ask you were
> this is implemented in the code?

"HOST:PORT" and "unix://" are handled by `create_server` in
bitbake/lib/hashserv/__init__.py

"auto" is handled by `handlePRServ` in
bitbake/lib/bb/cooker.py

> Thanks again
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

