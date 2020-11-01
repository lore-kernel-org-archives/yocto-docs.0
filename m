Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.18503.1604253133870383474
 for <docs@lists.yoctoproject.org>;
 Sun, 01 Nov 2020 09:52:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XoLpdI2v;
 spf=pass (domain: linaro.org, ip: 209.85.219.176, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f176.google.com with SMTP id s89so9725940ybi.12
        for <docs@lists.yoctoproject.org>; Sun, 01 Nov 2020 09:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dphq/7CWWTOcSEfQa8tLoIyFr2JoT9N8oX9VJiK/1U0=;
        b=XoLpdI2vh//wojuB5OEimyQNtnlfRl1DxB/eR4w4JrLr8AoQtgY1GFlTb71yu1+wAe
         uYOlvhM0jZOSVfdp15dKXCgSbFgAKFZQgJuoKWbagDEAbonlHHyzxByg8CLdntuD4umO
         y+7SUuQAxy3ZPOQw9b+KF9RM2osahygHF+adG32pz8Psa01ptdFNx70lXiQqyTFAZ/lo
         MwSzZ8HSzYHjoOs8HhYsLSI5QT/1cUFeoU7AWmMMQaGadzRhg/msnWBGb6HcqjTwYNwT
         xrsf0NlAz4MkNCRstFA3J8rsdAeRZfx7+TxsNiclIqkl+C7rxcGHz3zlXSvasGMVqng8
         Z5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dphq/7CWWTOcSEfQa8tLoIyFr2JoT9N8oX9VJiK/1U0=;
        b=bMIYzP44/4NDK+KDHiqcqb2+B0YzhQ7o6Bzi8LxzEFSwKcgjM7rcwry/xptjQuVNwD
         u/0f+LVAyUCI35sMJInqe/sv2PkMVqMO01W/LTCzU2suGzEI5MUOHNa0VICE2YSkuOud
         TDmF3Nk5JiMzAOpGYSRDBdw49btvWNmO5zvApjz+t0iGAq48e8MFVO/so1TdXpzxNd1C
         57Eeni4I7C2zuBkE4uP+QsVVQPfll9SgF276/yygmBb1JzpKpKDLIesufmCgWKB4VpM1
         cbWZy/koAWBLF4n/Bre/SSG1ucXnVdmivgPswB8/oZo0WwRLGTkMm+PDShQhuAqYRGu7
         dBeg==
X-Gm-Message-State: AOAM532TLGQNPvXddakLuyB9Gs91Zba9G3Ji3ujwv61iThi7s3HA7FuO
	Iy+4na9svO1PgATDo3OFq8VWetLBhs92rk7HzyldBQ==
X-Google-Smtp-Source: ABdhPJwukIg2GzT1Wj6yX84vENjfPA7G6cTnTupp9siKYegMjyuOg/2s6POjt9g7xhpHb+P80b/XZUWyCGlq78+yoZI=
X-Received: by 2002:a25:2284:: with SMTP id i126mr15775910ybi.454.1604253132800;
 Sun, 01 Nov 2020 09:52:12 -0800 (PST)
MIME-Version: 1.0
References: <c0ac296c-525f-b22b-4ef6-3dc0f5e36ae6@crashcourse.ca>
In-Reply-To: <c0ac296c-525f-b22b-4ef6-3dc0f5e36ae6@crashcourse.ca>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Sun, 1 Nov 2020 18:52:01 +0100
Message-ID: <CAP71WjzgZgVT0exd0YwAcCn=mp3QzekDLkvrXzb8ZdN-+SYzRg@mail.gmail.com>
Subject: Re: [docs] generic admonition versus specific admonitions
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 31, 2020 at 4:14 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   as i'm sure you're all aware, reST supports a number of specific
> admonition types (note, info, error, caution, ...), plus a generic
> form that is used thusly:
>
> .. admonition::
>
>    blah blah
>
> i was interested to see that the use of the generic admonition is
> confined exclusively to a single .rst file in the profiling manual:
>
> $ grep -r "\.\. admonition" *
> profile-manual-arch.rst:.. admonition:: Tying it Together
> profile-manual-usage.rst:.. admonition:: Tying it Together
> profile-manual-usage.rst:.. admonition:: Tying it Together
> profile-manual-usage.rst:.. admonition:: Tying it Together
> profile-manual-usage.rst:.. admonition:: Tying it Together
> profile-manual-usage.rst:.. admonition:: Tying it Together
> profile-manual-usage.rst:.. admonition:: Tying it Together
> profile-manual-usage.rst:.. admonition:: Tying it Together
> profile-manual-usage.rst:.. admonition:: Tying it Together
> profile-manual-usage.rst:.. admonition:: Tying it Together
> profile-manual-usage.rst:.. admonition:: Tying it Together
> $
>
> a few seconds research showed that, while it seems overly bland to use
> a generic admonition, it has one cool advantage.
>
>   if you use, say ".. note::", then the rendered note always has the
> caption "Note" by default -- if you add a caption on that same line,
> that caption becomes the first line *inside* the note box, while the
> box caption continues to say simply, "Note".
>
>   with a generic admonition, however, if you add a caption like, say,
> in that profile file:
>
> .. admonition:: Tying it Together
>
> then that caption becomes the top-level caption of the admonition box,
> which adds some emphasis to the caption.

I added the 'tying it together' admonition, since none of the generic
ones were relevant. Otherwise we use the existing "note" or "tip" in
other places, in which case their caption is "Note" or "Tip".

>
>   should there be an aesthetic standard?

I am not sure what you are asking here. Can you please clarify?

>
> rday
>
> 
>
