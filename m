Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C876CD4F54
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 16:47:50 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14868.1780073265198785953
 for <docs@lists.yoctoproject.org>;
 Fri, 29 May 2026 09:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YMcms7pT;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ccdef9f3d4so14294856d6.2
        for <docs@lists.yoctoproject.org>; Fri, 29 May 2026 09:47:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780073264; cv=none;
        d=google.com; s=arc-20240605;
        b=YMuYkIyJ7IYAXboheeuKKyKp8bKKfbRVF+dRTQB7zzYe0L6Kgj59uIMxnkGy7fnC8y
         l0SnFJhAB0l9GK2r8BQpaxlartEiQHQ8b43wHuoDMZ41TztgN7AqYOho7ya0MtbhoHXt
         GlGWC9z25Vco73ORjr/a5C+o6FL2CxErEG7N702qMBB+AhvgXUWOs/pExXmG2oDg3R9e
         uFdm1cr1h2AQSJMWcmV37rCkiBFn2Lm3xZMsdYN4CRVY7ATNUNjO64rq+XpNAZD7PMGs
         2fxQDV2gyFe8sgxLPwSE1chhSGe6hc9cYJ9PztvHVf9l/p8jb4enRouGi3Ho5fURKHM6
         HdSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eApA8ktP8anQfJIejoe1t8pcSSzuSYWCD0i2fB7lDS8=;
        fh=uH0syK/O6p96KHdLauSqg5RUPoH97TC6HSUdNQMG4hs=;
        b=TEv80a2kuSaopCCjxWnxMYpQ+vOlvQnDQ7mOR9pSr72BI6s7qD/zjC0BTU+iIMsMKd
         qzgBavcPAbkYJmiQTPNhxMGPhrTNslNetybj5ybybzPHuvHOtaTx+BJ8BbRCpD6FYNAC
         A3K/p8c+qHsJgN4ZCZGZcJjaoUCarFemk5alHKPrO0U4tMZSKlHN5pFDQy0gvQLnSUGp
         hIGSb9VRFLSaQ0OJ+v+vRI88Mgal1BoUA5kCfwUBRTXwCnpt1vSEH0uuepYRVWqQG5rm
         L3kkRcD0uH+m3yeKXAG2JMMelU5rL5sNTtSdsShj9pFIQ1lk3RYYjEE2MCe+FajaEJ9Z
         QVNQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780073264; x=1780678064; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eApA8ktP8anQfJIejoe1t8pcSSzuSYWCD0i2fB7lDS8=;
        b=YMcms7pTYLJCfmc0VzBabrF7OFYQjraihBXXbMAfsQjSoOc1swyh4KeoOHK7AmiuR6
         xOyvK0izTd0+05CyFOKc8ZJCLb8XWLuidNbpBAWJs2dIn35nAajL6GpdHquYjMrGJaG1
         oUn/LkesIPoneqbdgAwxFOwDugDhTBchX4uzh34GB2VQZsA9W+VGPtazoibYEsnvZLUA
         n8YDU5p6UQwO1Fk1U7A5pZ0QFx/sAFfjccgia9IsN4Inx1HtXiy19FBVYhfuiMk5CpWw
         X9mY2B5r/BU4/KrgxogwhxEXIEJF8LFQKKaL/AiqOk0z4QLnI3B3+Z2YAr2NoDS4iDz+
         lVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780073264; x=1780678064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eApA8ktP8anQfJIejoe1t8pcSSzuSYWCD0i2fB7lDS8=;
        b=Tk/77sEXAYZshwR3nRlMGqGAvaSZqPRXXzqKmXXAaoSljCaVAf7MYi+2MC9XO1lJan
         tDaeBMfXmP4LrYDjYkoCx2G9nelEiPKwF9dZndVrKfXHzjycUwrUOdrZXYGAiCn8AoaW
         46jbbhxBbpFhP2M99SnjDSvMsUjXGDEZ6+pVp+eUCHqU3cqmznJCOcDSfw0ORv7OtxYk
         i5FlAGBPNzC/dXOFjbaa9mXKrixGnxdtk2vWts43NQzczzw9m6O7V1tvweboa2flF3iv
         sa8ul33NJLF4Vz/87JZF+Wi3CXP4sSi0sUosZnFuxzwJTJD5SmHKKVycPGL1mPcThfl4
         ODMA==
X-Forwarded-Encrypted: i=1; AFNElJ+QHvkOiIH1dLorvIAu5OVn6Tkou7zpvmaIFEiV7ZjYXgfIdkVvSt+L2rGiwQqASz1XJmEq@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YypEu80ZJizFvhSRDdkdVtYwI7Jf75hiIQM24pJ0ZQgju08BbW3
	xQhwCpV5kxDwJh2ZlhtTQ4wTXAPaotvhIxBFfUnvkz4Qjic1NdcqLVy/62LxF4aIcztJdbTqrC/
	U0nBLc0Q7kcLLh2JFNtGJ25JnqD/hopM=
X-Gm-Gg: Acq92OGxW/5IKR/PPV8iqmS+uS8p3vk6OoxkJ9AXf9hS1/dAOp33YU42evxzZWWewVU
	Sgs1zwga68M1rE0HUUCh+waErzKSxAak0ztgxKloTT2AYprPM5GuDhacHWUtdN+Ci+AjQRqPuLi
	XHYL1ZxVOVNhFoqQ6c31aFX1Ii3s7rPEbk14YlRIIG5aZAZ87yHgqFF3gIKlhCcDeBBNiMyl+vu
	4KXyiS4ufPOhdWCj/lwmFQq4Bm0C6+QG23DYnbUJc3U3MWZyKvhU+Jrl8o7ak/71+C2i7WLt/q5
	nfwtB1RoXjW8OECU+iWYMVLoxxBWywKzPJcHWs4eZP4lU+Kk2zP1
X-Received: by 2002:a05:6214:1c87:b0:8ca:f1c:6493 with SMTP id
 6a1803df08f44-8ccefd32d20mr8318366d6.1.1780073264262; Fri, 29 May 2026
 09:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260529-bb-setup-notes-v1-0-a251ef1c5af4@toradex.com> <20260529-bb-setup-notes-v1-1-a251ef1c5af4@toradex.com>
In-Reply-To: <20260529-bb-setup-notes-v1-1-a251ef1c5af4@toradex.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 29 May 2026 18:47:32 +0200
X-Gm-Features: AVHnY4LWoueJhm-_3wjMR7i3P19m6ybZd1AD6XVcaksMtnv2Jzcl58cu7jf5uus
Message-ID: <CANNYZj9dR3cdss0_6BZ7QatGQYBvF9phtnu8bX5S1x-mqHUUJA@mail.gmail.com>
Subject: Re: [bitbake-devel] [PATCH 1/2] bitbake-setup: clarify configuration merging
To: ernestvanhoecke@gmail.com
Cc: bitbake-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, docs@lists.yoctoproject.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 May 2026 16:47:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9544

Thanks, this lgtm!

Alex

On Fri, 29 May 2026 at 17:00, Ernest Van Hoecke via
lists.openembedded.org
<ernestvanhoecke=gmail.com@lists.openembedded.org> wrote:
>
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> When nested configurations are used and the same key is present in both
> configs being merged, the Python "+" behaviour is used. This leads to
> lists being appended and strings being concatenated. The first is an
> intuitive behaviour when specifying a tree of configs, the latter might
> not be.
>
> Clarify the configuration merging behaviour explicitly in the docs.
>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
>  doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
> index 77fc4c3dcba0..1252f22c823a 100644
> --- a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
> +++ b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
> @@ -1068,6 +1068,12 @@ They contain the following sections:
>        configuration choices by putting together information from a leaf
>        configuration and all of its ancestors.
>
> +      When the same keyword is present in a nested configuration and in one of
> +      its ancestors, the values are merged with Python ``+`` semantics. For
> +      example, lists are appended and strings are concatenated directly. String
> +      values such as ``description`` should include any needed separators in
> +      the configuration data.
> +
>     -  ``bb-env-passthrough-additions`` (*optional*): List of environment
>        variables to include in :term:`BB_ENV_PASSTHROUGH_ADDITIONS`.
>
>
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19564): https://lists.openembedded.org/g/bitbake-devel/message/19564
> Mute This Topic: https://lists.openembedded.org/mt/119548245/1686489
> Group Owner: bitbake-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/bitbake-devel/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

