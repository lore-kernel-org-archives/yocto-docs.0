Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.11063.1585314744763155339
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 06:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T0YSOpub;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id a43so11028794edf.6
        for <docs@lists.yoctoproject.org>; Fri, 27 Mar 2020 06:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=n84b8pC6dry4RVlQ2TgI67IpBjQMYgC8tWWEqxtC6nY=;
        b=T0YSOpubWZAEITqR4/oCdZt5oeu9GgICNWbSjOnc0KZU4nzvt2FW0ACmdAO6sOQOHs
         inRppDPXd305La3sDtq+mZGIbYstEUq1Z98zKRGMltDG3onAugYjGFnZln9DavRcgOun
         baBJVvPfS/bL5uL6aB3KGK20dm9lx9Z+d46EDuwxIOOxVfFHw8MmU2zFOGvQ18A2sHvT
         TComgvQcfS+CRNKlYuKLH3RudIIo0mB79HU+vw2vdxTRKHtESz1y9b1zBZoX6ynsLfPm
         /TCRcLSi6Spc+7W1gdn+WAFQzf9CsZCJ9B8eFeguPy0j4uz3tTVq8wvKXsM2ecEkwFPl
         Vz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=n84b8pC6dry4RVlQ2TgI67IpBjQMYgC8tWWEqxtC6nY=;
        b=GchSJsBhtxyQL5vDDz8ba/xLeqvpC3zJu3MslS+zklxL/VMtabPoL1158sXxwE1T5S
         m0RBe9E7+/Jb7iaDQdNkzE0vXUtDE3EDBe4ydXs3Rt/vhbea+yg919pZXBk+FtE0amQ4
         9pNufAkTjlnSYaasjnN9wQOY4BV52+Bw0NFJ8aIa1VW/brjUBhAglDvkZQHpbAFtUTV5
         L2SUtB2dBJCHiPnzkSvoOYjQgVSn2SjiPJ1ECiQChEI/wnYx7tR0y/KMc8T67qWgmV03
         bjeN/N9U6zTEOyUQ4FrMKEUWF3ah8sNQUcIWXdNV3Mim3G4DCtw1zpVq+kbfsQnUq7sT
         fxhw==
X-Gm-Message-State: ANhLgQ0K1+HBjc1dF2Nlo0CrVf7K6x1B1xRQqcBuJRRsFaN7XYNq6Tiv
	F5T1YdmUCyRLVgIaGPRM5GChOZGQ30FDAzNGsTE4OyJGkeo=
X-Google-Smtp-Source: ADFU+vv0XiRL0Gx8HHyhY8OZlqFCO0VwQxJablvilrBYsre/1MpWXu9YOjGiPkj5psxxduIj0+kSSPQVvx0ecL1HzYE=
X-Received: by 2002:a50:85c6:: with SMTP id q6mr12670719edh.347.1585314742920;
 Fri, 27 Mar 2020 06:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LFD.2.21.2003261745190.13649@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2003261745190.13649@localhost.localdomain>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 27 Mar 2020 09:12:11 -0400
Message-ID: <CADkTA4M8h8pwrGcut0uy8PLLpwCnSuY4y2fM6hPwiddCoN8sxQ@mail.gmail.com>
Subject: Re: [docs] is there an updated/current version of tom zanussi's kernel lab?
To: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 26, 2020 at 5:47 PM rpjday@crashcourse.ca
<rpjday@crashcourse.ca> wrote:
>
>
>   for upcoming YP courses, i wanted either an updated version of tom
> zanussi's and darren hart's YP hands-on kernel lab:
>
> https://old.yoctoproject.org/sites/default/files/elc2013-kernel-lab.pdf
>
> or a suitably recent version that i could update myself and contribute
> back to the cause. anything?

There's nothing newer than the ones you found (as far as I can
recall), they were put on the shelf due to not enough cycles to keep
them updated.

It might be worth looking into what is done for the kernel during the
Yocto dev days (or similar events).

As for reviving the labs, I'm sure it is possible, but I'd first make
sure there weren't better options.

Bruce

>
>   related questions coming shortly ...
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                          http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
