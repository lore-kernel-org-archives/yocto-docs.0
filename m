Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.5038.1582203924488672429
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 05:05:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pne8oNW+;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id p23so33616405edr.5
        for <docs@lists.yoctoproject.org>; Thu, 20 Feb 2020 05:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=OGbZHkGKlK43qJL3QrGv5jsRKI+4Gg2jxepLVh3XnuE=;
        b=Pne8oNW+X6SztNX34Zbwbck10oaCgoKHXUhJntRU9cEjeEViyRB3HRP+/D4QiPgES0
         cbwFF6Olsx9CcoeZDa5z0PgQE2C8rcTqoZyavZnS7gKt6iMiCD0rAMXY1QT1LvypMOni
         GsUT7ydhbCsM6JSMlqAHXhTuZE7P9Vh1IhbO1Qmak1XiXtXUIUovjmieu70vBCl66u14
         ivWcvKgvajO2r+E/qHSg9osVFGQOwz2O6pLUPhInv4KZHyXDfKrgz3YpTQpmAoQp/ahP
         v7qswaupGHePLrXdvx3LiAu3dE1oSj6JUlIa8+RA+dNTofwnoZXb55mHbKXoVlu1Di2X
         0FJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=OGbZHkGKlK43qJL3QrGv5jsRKI+4Gg2jxepLVh3XnuE=;
        b=XoG31wLToVUqwN5ClWtkjyH51NfMCd0/lzCAunlIn4/8S+pmN+o4Stv9hICpSTj3rn
         R5msKa4/WL1GdrgYX9R8GC2kWuNEWlG+XfmI/6rI6OE9Sbmqrh6IFiN2QySK9oCOasHa
         enjX8seUkfD2ASb+fYY7uEWEkV5Hn4ukWjjuyR484VeuBISkY8cyZdAidH09xVMdhYxl
         uEnC6BZ76h17gsFLWDdS5/+Ki3gkXIfXSSRjh5zhFLt/g+3U65e+LGjgNuXvxdiSSJP8
         P5pjI+j+Ngeb0Gs7zuh3rhAZA5vX79u2U+tyerGyuUl5FVtals6mC7WVgKQEstXJdib0
         bKkQ==
X-Gm-Message-State: APjAAAWp7nMxGZX9kO0AZRMH4xOtLevNy8RXUIN8WwlmpUjzqwy1+TpE
	7ErbHv8PJ6Nl1dnASv8fEgFbRag7j7y8F9oWK4NW1xrR
X-Google-Smtp-Source: APXvYqzCUFUQ2ISfGLzeO61jO5W9KSeZwHbIAs1SJL1TR3n7iU6ZidarZmrG0BeP70nDy7em1Atv9V07DJ3Y58BUiAY=
X-Received: by 2002:a50:ee8d:: with SMTP id f13mr27424943edr.347.1582203922595;
 Thu, 20 Feb 2020 05:05:22 -0800 (PST)
MIME-Version: 1.0
References: <alpine.LFD.2.21.2002200346570.15458@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2002200346570.15458@localhost.localdomain>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 20 Feb 2020 08:05:11 -0500
Message-ID: <CADkTA4OcvgoJE8ksdjFtQOLYnyaPRXGJXHeY3iDd9ooPD00Knw@mail.gmail.com>
Subject: Re: [docs] "KBUILD_DEFCONFIG" description in kernel-dev manual seems wrong
To: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 20, 2020 at 3:53 AM rpjday@crashcourse.ca
<rpjday@crashcourse.ca> wrote:
>
>
>   in current kernel-dev manual, section on "in-tree" defconfig file:
>
> https://www.yoctoproject.org/docs/current/kernel-dev/kernel-dev.html#using-an-in-tree-defconfig-file
>
> the example given is:
>
>  KBUILD_DEFCONFIG_common-pc ?= "/home/scottrif/configfiles/my_defconfig_file"
>
> but that's not an "in-tree" file, is it? i thought that variable
> referred to just the file name within an existing kernel source tree,
> no? the processing in kernel-yocto.bbclass certainly suggests that:

Correct. It is for defconfigs that are shipped with the kernel itself.
The standard 'defconfig' in the SRC_URI covers other cases.

Bruce

>
>  if [ -f "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}" ]; then
>
> should i submit a patch for that? perhaps steal the example from the
> reference manual:
>
>   KBUILD_DEFCONFIG_raspberrypi2 = "bcm2709_defconfig"
>
> rday
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
