Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18125CCF9F8
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 16:15:39 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.19362.1761927336638968808
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 09:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GV9jk3wc;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-87fbc6d98a9so20019186d6.2
        for <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 09:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761927336; x=1762532136; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QamHK6AvIBydJ02ugL1A58L1j9l3pqEIKg8FcLclofQ=;
        b=GV9jk3wccJ6C9chhZqWfcrhNovekQYyLKIBZ0qb6nfeSDEf2u+DMXOgg0DthxT++9o
         YyZHvdsnyuYTBgn3hstvZppJ5xMSYzpVs+wCiiewMOy4vK3jDkHAJAGIJcT+8/sHbJ7/
         4ffauLuGXjnnpipPy5pmzIyu57FJkIa+DgDtoncCowrpXhNFBkzzXvZffr312d11Qy9B
         HOwT3EV+n0NEfnpaIh269Ix/q3Mn22odhnuoXaOvjyfHpw0hZ/1xPE+tEEsaJWEhlnQT
         2gLurNz4VijUrHD+8yUQyc/b3qpz753gFJcTjF4p+PILlcs7YmvDS+RtjisPEmBV4+my
         VjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761927336; x=1762532136;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QamHK6AvIBydJ02ugL1A58L1j9l3pqEIKg8FcLclofQ=;
        b=VMye6sctoW+vwBntVJ8F8PC90Y1LTMpfstbgq+Zd96/KrDsg17pcVbF4Vy4ja1zHtz
         UFYyCvFSi3u0VijjIPwDxG5z9eH3GuFNLyfnEvpCG2CzrUnHxZgjSylIWru9jM+qB1YF
         A3nSFtqNfFgT1uAsXl3M12W1gMjT+9o9dyFUkx+V6I5rE0PELja7RWKdmgkZG94+weHE
         MWM4Aqn0f5i2tPzB8ksh469Kfnfz+MxQhpu/r4qvRxPY6MSlfGSdIjHrHIurfmkTGXdr
         Z4JRhivvHGsaw9/MopF8SDh6HMXrH1N9XE7cJ6z9Il4uWv3dJLpz44VRiclCQcGNb2Af
         YcRw==
X-Gm-Message-State: AOJu0Yw1PJr662OfxAPCr4fmAADTaEPaBPQOg0RfpABBo7nT/qYXL6z9
	VmmU1Q7J17fl1zypLK64UmnPttRfhKl36ytfTpz56xpYdtZT/ZvurT63jcTVHMLtQpSCucxw32L
	KIOL2ctbss2XDZwXd73pkBsJSgkm03zodog==
X-Gm-Gg: ASbGncsTJGWejtgOHUQpahMi9pbypxqEDI8vmGrKLvDpAjhN2YR7AxwB+hLi8W0Aau2
	UOnyIBCiXwzKg4A/Pv6c9GM+smDiiiKXfhY325tmS2TTv69A63ZQjSklL72KhbG4VFFy9EkhTSA
	qHNzSCufUwsLKTWWRn8XRq/bIVrwWuwVK0jdf6yMbjGD3aXl4ksTb+YAbuAjdxES1M8DHcM49yV
	NK8jkSA4Q8atg1PQ/j28PIumOY3MV04busNf27G2sGWqOOsaG8JK4QinyVhcAkM1/OQLENY48RB
	ax3bn2p2W3WNUkdtsmrR5IowPgUsjFsPckszjhwhW5VWmig1Ru8a/H3wnLlKVtYLRyqK
X-Google-Smtp-Source: AGHT+IGBcDUlW/yIoVTlNIqiOGF+gE4letbEb3wwwDneJeotBZzxWTxxFX34c33TNJnYGO0lVITaieWAVWP1YxRPgfE=
X-Received: by 2002:ad4:5947:0:b0:87d:f41c:f547 with SMTP id
 6a1803df08f44-8802f2746eamr60774856d6.7.1761927335465; Fri, 31 Oct 2025
 09:15:35 -0700 (PDT)
MIME-Version: 1.0
References: <20251030-bitbake-setup-v1-0-f44a8a2b7c0b@bootlin.com> <20251030-bitbake-setup-v1-6-f44a8a2b7c0b@bootlin.com>
In-Reply-To: <20251030-bitbake-setup-v1-6-f44a8a2b7c0b@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 Oct 2025 17:15:23 +0100
X-Gm-Features: AWmQ_blrWp1559T5BwjjnsrlHbyhnPBmZmwnCRubAuvzfwYMfOFNqcccBpA56Qg
Message-ID: <CANNYZj_YvnVf+0Q+ZKBd6aYLyVNK6WGjN+LNqWaYxzYiySDUxg@mail.gmail.com>
Subject: Re: [docs] [PATCH 6/6] ref-manual/terms.rst: update Poky description
To: antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 16:15:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7957

lgtm.

Thanks for doing this, other than some tweaks (see my other messages),
the patchset's fine!

Alex

On Thu, 30 Oct 2025 at 17:29, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
>
> Poky as in the repository will no longer be updated. Update the
> description of Poky to remove the last bullet point, and add a note to
> say that Poky was used before.
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  documentation/ref-manual/terms.rst | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
> index e25c714d9..6a9f88061 100644
> --- a/documentation/ref-manual/terms.rst
> +++ b/documentation/ref-manual/terms.rst
> @@ -461,11 +461,26 @@ universal, the list includes them just in case:
>        -  A means by which to test the Yocto Project components (i.e. Poky
>           is used to validate the Yocto Project).
>
> -      -  A vehicle through which you can download the Yocto Project.
> -
>        Poky is not a product level distro. Rather, it is a good starting
>        point for customization.
>
> +      .. note::
> +
> +         Poky also used to be a repository containing the combination of
> +         :term:`BitBake`, :term:`OpenEmbedded-Core (OE-Core)`, the
> +         :yocto_git:`meta-yocto </meta-yocto>` repository and the Yocto Project
> +         documentation -- which were combined with the :yocto_git:`combo-layer
> +         </poky-config>` tool.
> +
> +         This repository is still hosted at :yocto_git:`/poky` and is still
> +         updated for maintained releases that are older than Whinlatter (5.3).
> +         Newer releases now use ``bitbake-setup`` to clone and setup the initial
> +         :term:`OpenEmbedded Build System` environment. For more information on
> +         how to use ``bitbake-setup``, see the :doc:`/brief-yoctoprojectqs/index`
> +         document. An alternative can be to setup the above repositories
> +         manually, by following the :doc:`/dev-manual/poky-manual-setup`
> +         section of the Yocto Project Development Tasks Manual.
> +
>        .. note::
>
>           Poky began as an open-source project initially developed by
>
> --
> 2.51.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7931): https://lists.yoctoproject.org/g/docs/message/7931
> Mute This Topic: https://lists.yoctoproject.org/mt/116033124/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

