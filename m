Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.28647.1604308361475862347
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 01:12:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hQum6Gqo;
 spf=pass (domain: linaro.org, ip: 209.85.219.181, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f181.google.com with SMTP id k138so4624993ybk.6
        for <docs@lists.yoctoproject.org>; Mon, 02 Nov 2020 01:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gt9ehIKRAPQ0Y+7X1hS+5eNS5ZUDDLbrdXyPGmogBmM=;
        b=hQum6GqokT70l9CWxb+T392H0XwW16TF7dPiar2Fjo1ryQalSX2F8qPhLkP0rjJBEv
         TFu4Wm6sATQMmH3oKLDi8DPl6K3VZ2wFngIGGDqyQ8pB3HSaWk6hK47zJUThtohhBGS0
         /l+A8GAi8su6SH0sz7wR3Fit0P2o9AZZhc7cRfT8fd2BybzI8QqpUvL3k9LCy9WQsCzH
         gXqwlGu0eP3AgKzuCtz3B+mqXKCU103zPswabGw2jhC/47b8Rmp3YHErHTskg14iLVQv
         W0W6txjmQxTQ1SIhctQnnlaoJ0YGvGs/vNZmEbRkR1srfD4jBaT8JhaCUONewRQpAD/9
         0Yww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gt9ehIKRAPQ0Y+7X1hS+5eNS5ZUDDLbrdXyPGmogBmM=;
        b=Jt94Gr9I2vtksAr5uFMCi2B3Pc3iQdYn9aG5KvuFujqqMRfupDcJdc9FB/De5E4X2b
         h5avaI0JuV/fMpWBbBipfLx/1Gswtp7GylAUkUr/Owp8ZmSe067ZPK20fMc/7i3Eir6q
         JwknSowwxLEDmpZY81lyzAazUSLl7MzVxadxTVftL5gSAdw31wNvPxJ0itI0f5pdJ8Fc
         Y/g94kopo4EvlB4zbn8V8tsYy58fzgpi3ooTq1GvHlP//MYvCFXGG2Mgl3tzmaJATdMM
         j8DqVNRCoQXOEmL3wkUT3UhSDDtZneovSfnSAu5OL/YwgeGCSMReEZFvQ506Xfuue2kO
         NIHQ==
X-Gm-Message-State: AOAM533wOCnNgbe5z/jFIFo61X9EvGSDCRPlEPtngvXFGAXfc2J1CvHo
	X7JvslmOpHr2OXUqLms5Qj1iipv0Dy7mwDAbKsg32g==
X-Google-Smtp-Source: ABdhPJxjKKekfv1oyJrS5ZiFqhvFGOTiNJE0tIHwGIkEeQT7WGtJfmDVbmux8I3aovvLSYqlviC+HtAKJ05H8QLYZ0M=
X-Received: by 2002:a25:4654:: with SMTP id t81mr21054423yba.475.1604308360565;
 Mon, 02 Nov 2020 01:12:40 -0800 (PST)
MIME-Version: 1.0
References: <d4ec497b-6647-b2ec-c1d2-d6b387223f19@crashcourse.ca>
In-Reply-To: <d4ec497b-6647-b2ec-c1d2-d6b387223f19@crashcourse.ca>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 2 Nov 2020 10:12:29 +0100
Message-ID: <CAP71Wjxh8bKnDYBTrcuRv9jzhGAwOtuYyE6hPriZxkehheK5UQ@mail.gmail.com>
Subject: Re: [docs] what is with the use of anonymous hyperlinks used for regular hyperlinks?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 31, 2020 at 9:42 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   another oddity in the .rst files ... i note the use of what look
> like anonymous hyperlinks where regular hyperlinks are used, like in
> overview-manual/overview-manual-yp-intro.rst (note the trailing
> double underscores which typically denote "anonymous" hyperlinks):
>
>
> For further introductory information on the Yocto Project, you might
> be
> interested in this
> `article
> <https://www.embedded.com/electronics-blogs/say-what-/4458600/Why-the-Yocto-Project-for-my-IoT-Project->`__
> by Drew Moseley and in this short introductory
> `video <https://www.youtube.com/watch?v=utZpKM7i5Z4>`__.
>
>
>   as i read it, the double underscore defines an anonymous hyperlink
> as explained here:
>
> https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#anonymous-hyperlinks
>
> those hyperlinks above look like regular hyperlinks, and removing one
> of those underscores doesn't seem to affect the output. so is there
> some magic with those double underscores that isn't immediately
> obvious?

I struggled on that, and that helped me:
https://stackoverflow.com/questions/27420317/restructured-text-rst-http-links-underscore-vs-use

I believe we should use anonymous hyperlinks.

>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                          http://crashcourse.ca
>
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> 
>
