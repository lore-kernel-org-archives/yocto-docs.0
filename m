Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web08.4001.1606292191001906794
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Nov 2020 00:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=DV/HbFDk;
 spf=pass (domain: linaro.org, ip: 209.85.222.173, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-qk1-f173.google.com with SMTP id i199so2943652qke.5
        for <docs@lists.yoctoproject.org>; Wed, 25 Nov 2020 00:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=P3VkHa4rK3MuHVMmP3pKFfBr6GdYxY7oswFrr3vYfqU=;
        b=DV/HbFDkoXm3iclBNQXZO00pszdukmRLUKwcKExcIGzEZEYM0gai2vq8j2wFGgQGQ8
         Yc2zPrvW4UEeGwzwjcwyY3dFDBmAdXgiogcoIHSUJ0GUk2cHnQCH/b+BGdTJSWWFrfli
         AzXiRnMBak089Gc3YUjaNp3fx4QWmAzi9Jy+gSyyTPTtLrqFU/GEJIjTxDPTwceUvaPP
         gruqu58PfEkQfZgTG4pRnl4DT7HqWU5MESt+KHG/yKlofAaqo2KJ0s7c0+PlblRxVegs
         zAXBdATYHeF+BeSpUcdZphi5CBf2mZeYkiA2halNZ0kcVkIeCCkIayUgHYj6caW7eRv5
         3H8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=P3VkHa4rK3MuHVMmP3pKFfBr6GdYxY7oswFrr3vYfqU=;
        b=uCxrUtwmKcbbfqcYQC0A6Me5qUJn/YLnzcy719WqkADF7h3RvYwPnt5en8iG9Hg473
         x9+dJis+ajTZWr8X/TC9cdr0RZ87zf3zA3lYSGqLWMExsCm+5zQFF9/dwKLRaFjhMj3Q
         wBe1UzBoDrRvM+oOleb1sRXLA2oCZB0HjqNtkDaU5tZFbchngtaj64XrhC670ruPMxe4
         aL31dUjGYNs6LHrJ9vBtvBjL8c3tU9q6Ll4nnuCFeYFeMDpKVeCUoJYLvOWczc9tj+25
         0zlIoXBbH1aVKmaggTXdJrO1ZprEWWN6bTSvUyMB3tKnvJgCNrgzyPttJwRygvL+1hVU
         0jHg==
X-Gm-Message-State: AOAM5338atKWEaJl87GEQedDgllnF57fhxgRD7i7cI+26qOvglyrqXNM
	eFdVp273uKxcmeOhmiqWiN3gyT0ylhIsOqdWc3suOhCfQ87OHoZgrjo=
X-Google-Smtp-Source: ABdhPJyDjy14zqxBihphxCXH3fg0TsPGYMWW1jX41bK4QXEIGArpLR33gmbWvxKwloyBlr5ML/AWytgJfiQf9RgJcMo=
X-Received: by 2002:a25:1e43:: with SMTP id e64mr3310947ybe.273.1606292189683;
 Wed, 25 Nov 2020 00:16:29 -0800 (PST)
MIME-Version: 1.0
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 25 Nov 2020 09:16:18 +0100
Message-ID: <CAP71WjycS2eV0FZ0sVADhfRMAoHUdKafaCAgZq0W-nRQ2F-zoA@mail.gmail.com>
Subject: RFC: remove backquotes in section titles
To: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

hi,

In several places we use backquotes in section titles, such as here:
https://docs.yoctoproject.org/ref-manual/ref-tasks.html

I don't quite like the html output generated, especially the mix of
fonts and sizes. Note that the rendering is very close to what we had
previously with Docbook docs as well, see
https://www.yoctoproject.org/docs/3.1/ref-manual/ref-manual.html#normal-recipe-build-tasks

I am tempted to propose that we remove the backquotes.. this is
especially more important with Sphinx now that we tend to rely on
section titles for references, and it makes the :ref: more difficult
to write and mentally parse...

It's a non trivial change.. so I wanted to get feedback before even
trying it (or at least adding on the todo list).

thanks
nico
