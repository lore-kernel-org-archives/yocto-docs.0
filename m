Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C95C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 13:39:01 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.15703.1716471540743292776
 for <docs@lists.yoctoproject.org>;
 Thu, 23 May 2024 06:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EnBIxBlp;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e719bab882so60986051fa.3
        for <docs@lists.yoctoproject.org>; Thu, 23 May 2024 06:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716471539; x=1717076339; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=40/UePfIplSMm3b/oTz56Inn0ioqFS4osK7ePbrz9+8=;
        b=EnBIxBlpr4nXEKQkrmsYjmDtVqY3QM6Rt07G7h3juBknVvOE+obD54uQB+xQDwcB+T
         j3PjkkjAR/e5wz/L8cvhLCrdXRsZf1meR+FauPJVQyv1g1s/PLELHJCUo3E3+8X1SDXN
         5pQ4e1qwOdn3oNVVKqSKIkNXB9WwxBBC0YFdqRFGyRdD4tMvFYj4LgB8yiS/sd3XL1ow
         Fdtw+WrDxzJcpiAkfAtZ8cpTwSyihhhWEqyqo+5POgUFe6fvwfRUzYlGbzVaxob39g6J
         JFZpKA/Wx4XnRkkaolJ6B2+DP86VzVof6cICdUOVWnkmqKewT6Iotsm0ctfZ3RnHlQ9a
         6Yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716471539; x=1717076339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=40/UePfIplSMm3b/oTz56Inn0ioqFS4osK7ePbrz9+8=;
        b=NcSIAguBZfKkyXTa0tG4yH96h2RG/+xXJGGUuXYe9OWnx1k/3B/pzR0SabTu0aJ3BW
         VvCmCvQgWwu7nXVsbpphmRqc1MBuuwNecj7Emy1ltaNpaxnRSNlAW+ejoR1/zRW5oLFS
         Yd/jMy90hcuKYe1L4xklOGgtZB0kYjkydczvpEdjm5pjQWAA7n2vBYfOn7E/GV/CvFhJ
         QJfnyIPEhDUFSco2jUsvcSqkrCsDbIW6PKrmxni09bVg603Fw29ayBO/daALbdd13DdI
         RSd4+z7+xtV6lP7AQGZ7cHD9bfqIvH+d/zKFSiI24x/NdV7x89rp06ytlK3O/cDwKXfT
         DPYA==
X-Forwarded-Encrypted: i=1; AJvYcCWDZQP+zimUZqcH7xa6hYm9OK6O+frj7Hk9ntEDkLRia7F4zurHXcChDhzdIvx/wj9Pekwu5QfbjvlyqP6POb2EcQ8qW5mbUo1ISsQ=
X-Gm-Message-State: AOJu0YzlNTkrwyQ02JMeTSEw4fcinffKGgL2J7r39GVNlWNg1ttuTDlO
	B5FO+zB5k821tHC0wWLBSBZQ3kF3lzFZVyEhwL3D1KhxqlBYK+PclR45B4Dx4t+WXTClEp8+6sx
	PtOiTZK0odM0d4U0UV4FxzEMqVv8=
X-Google-Smtp-Source: AGHT+IGNLjsJGH6CLQ2JQSgOESflmSJfy89C6qG/gGZ6q8s/L7IiFaR7kX4Ihztmbhw78aLpm9WuyI7IcUJT/HciqcU=
X-Received: by 2002:a2e:9b55:0:b0:2dc:f188:a073 with SMTP id
 38308e7fff4ca-2e94969dfb5mr37779121fa.35.1716471538602; Thu, 23 May 2024
 06:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240521173343.2954628-1-marcus.folkesson@gmail.com> <66c6fe23-dbdf-40a5-ad5b-393b4d1239f9@cherry.de>
In-Reply-To: <66c6fe23-dbdf-40a5-ad5b-393b4d1239f9@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 May 2024 15:38:46 +0200
Message-ID: <CANNYZj9TnoFbUkKnyvh=WgbTBp13rf6+0jrtGJiNv9A==bNYiQ@mail.gmail.com>
Subject: Re: [docs] [OE-core] [PATCH 1/2] image-bootfiles.bbclass: new class,
 copy boot files to /boot on rfs
To: quentin.schulz@cherry.de
Cc: marcus.folkesson@gmail.com, openembedded-core@lists.openembedded.org, 
	docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 May 2024 13:39:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5238

I also have to repeat what I said in docs@ list: why do we need a
special mechanism for placing files into /boot? If /boot is not a
special partition, then it's just a folder in / and can be populated
from packages like any other folder.

Alex

On Thu, 23 May 2024 at 15:26, Quentin Schulz via
lists.yoctoproject.org
<quentin.schulz=cherry.de@lists.yoctoproject.org> wrote:
>
> Hi Markus,
>
> On 5/21/24 7:33 PM, Marcus Folkesson via lists.openembedded.org wrote:
> > [You don't often get email from marcus.folkesson=gmail.com@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > image-bootfiles class copy files listed IMAGE_BOOT_FILES
> > to the /boot directory of the root filesystem.
> >
> > This is useful when there is no explicit boot partition but all boot
> > files should instead reside inside the root filesystem.
> >
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> >   meta/classes/image-bootfiles.bbclass | 69 ++++++++++++++++++++++++++++
> >   1 file changed, 69 insertions(+)
> >   create mode 100644 meta/classes/image-bootfiles.bbclass
> >
> > diff --git a/meta/classes/image-bootfiles.bbclass b/meta/classes/image-bootfiles.bbclass
> > new file mode 100644
> > index 0000000000..850e14e4bb
> > --- /dev/null
> > +++ b/meta/classes/image-bootfiles.bbclass
> > @@ -0,0 +1,69 @@
> > +#
> > +# Writes IMAGE_BOOT_FILES to the /boot directory
> > +#
> > +# Copyright (C) 2024 Marcus Folkesson
> > +# Author: Marcus Folkesson <marcus.folkesson@gmail.com>
> > +#
> > +# Licensed under the MIT license, see COPYING.MIT for details
> > +# Inspired of bootimg-partition.py
> > +#
> > +# Usage: add INHERIT += "image-bootfiles" to your conf file
> > +#
>
> Since it's in meta/classes, I assume we can also inherit image-bootfiles
> in an image recipe?
>
> > +
> > +def bootfiles_populate(d):
> > +    import re
> > +    from glob import glob
> > +    import shutil
> > +
> > +    boot_files = d.getVar("IMAGE_BOOT_FILES")
> > +    deploy_image_dir = d.getVar("DEPLOY_DIR_IMAGE")
> > +    boot_dir = d.getVar("IMAGE_ROOTFS") + "/boot"
> > +    install_files = []
> > +
> > +    if boot_files is None:
> > +        return
> > +
> > +    # list of tuples (src_name, dst_name)
> > +    deploy_files = []
> > +    for src_entry in re.findall(r'[\w;\-\./\*]+', boot_files):
>
> Isn't this a more complex boot_files.split()? What do we gain from using
> this regex? If we have malformed IMAGE_BOOT_FILES, this would actually
> introduce some logic error:
>
>  >>> s="plop\\plip;plep plop;plap"
>  >>> re.findall(r'[\w;\-\./\*]+', s)
> ['plop', 'plip;plep', 'plop;plap']
>
> I'm pretty sure we don't want that. Instead, I would suggest to use
> split() and iterate over that, split(';'), check for each if there's 1
> or 2 entries, add one if it's one.
>
> > +        if ';' in src_entry:
> > +            dst_entry = tuple(src_entry.split(';'))
> > +            if not dst_entry[0] or not dst_entry[1]:
> > +                raise bb.parse.SkipRecipe('Malformed boot file entry: %s' % src_entry)
> > +        else:
> > +            dst_entry = (src_entry, src_entry)
> > +
> > +        deploy_files.append(dst_entry)
> > +
> > +    for deploy_entry in deploy_files:
> > +        src, dst = deploy_entry
> > +        if '*' in src:
> > +            # by default install files under their basename
> > +            entry_name_fn = os.path.basename
> > +            if dst != src:
> > +                # unless a target name was given, then treat name
> > +                # as a directory and append a basename
> > +                entry_name_fn = lambda name: \
> > +                                os.path.join(dst,
> > +                                             os.path.basename(name))
> > +
> > +
> > +                srcs = glob(os.path.join(deploy_image_dir, src))
> > +                for entry in srcs:
> > +                    src = os.path.relpath(entry, deploy_mage_dir)
> > +                    entry_dst_name = entry_name_fn(entry)
> > +                    install_files.append((src, entry_dst_name))
> > +            else:
> > +                install_files.append((src, dst))
> > +
> > +    for entry in install_files:
> > +        src, dst = entry
> > +        image_src = os.path.join(deploy_image_dir, src)
> > +        image_dst = os.path.join(boot_dir, dst)
> > +        shutil.copyfile(image_src, image_dst)
> > +
>
> We literally iterate three times over the same files, I don't see a
> reason for not merging those three for loops into one?
>
> Also, I now realize that this was heavily inspired from what's in
> scripts/lib/wic/plugins/source/bootimg-partition.py, would have been
> nice to say so ;)
>
> > +python bootfiles () {
> > +   bootfiles_populate(d),
>
> Not entirely convinced we should have a comma after bootfiles_populate here?
>
> More general question:
> 1) how does this work if one has a boot partition created by wic (via
> the plugin bootimg-partition?
> 2) shouldn't we factor out this code here and bootimg-partition's? or
> make bootimg-partition somehow call bootfiles IMAGE_PREPROCESS_COMMAND
> to avoid code duplication?
>
> Cheers,
> Quentin
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#5236): https://lists.yoctoproject.org/g/docs/message/5236
> Mute This Topic: https://lists.yoctoproject.org/mt/106262122/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

