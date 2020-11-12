Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.1224.1605167541141463458
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 23:52:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BpY4sJJw;
 spf=pass (domain: linaro.org, ip: 209.85.214.174, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-pl1-f174.google.com with SMTP id d3so2369420plo.4
        for <docs@lists.yoctoproject.org>; Wed, 11 Nov 2020 23:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JXCPbQr88Y6L8M/MJ+o/0R1zNyyNVvCuinqT4O+5mEQ=;
        b=BpY4sJJwI4uWy5l6KJkQ7PniLiBvaEQmjohpYV7k4cL/l8BEL84omhemNZ+l/Hyhfl
         G3iTmxgK29Q8v/D7fZRrWDeuSt6Ii/dY6nkzsCXsBzZNXVp/5Ceu5DvdOyK4zn8OIzyf
         ud0FULJ1QcYZe52YP/VyhfMKx6GS0KlfSmlrdlurhge9/SWFY5t0hDHhC5xsbk5asLbf
         DXOfAcAn3tZvrle7QXljBY3MxpAkXMUEU3ygHAdmUMGZQa5nIl3f9KIWOeiiMijdhQD7
         4tKfT3UDR4WynuFvGUIk0zXnSD8ou0noQC9CXoQ3Gosu9pgqgOjvJ09zA0MTHo//FLpK
         r1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JXCPbQr88Y6L8M/MJ+o/0R1zNyyNVvCuinqT4O+5mEQ=;
        b=nYs2lwXeYTMynGq6bNphshRFyXI1Q3JH/VfHCgnMM4sINBD7lZfphChmMvy2x5RKl+
         g9VxToJpF6LBrmlwZInGdwWFXKvrw+wIKxyDw2FIIhICa+AY7sso3k7hixtCZkNFwiOs
         pk+FPrTye5CKUFJVZu3uwvaYFvGt29fmp7kpom/JeSXdw1XMhxFYGDrzbgzvQuA+G7QO
         yFfVh1LS27vqKGBheGhfqwtqjogH2VHMlGozpnqHTinMN4JVW3M7DalEtskNPhuGVJYy
         w507OjK6tVwE7ighTbqzyQhLCnjTAZ5IT+8Vv6CgcHWO7BHwpsViaFSIgnRKPbeQafQX
         2NHg==
X-Gm-Message-State: AOAM531DLUX5vgtri50ejGXz65wN2Hqs1B8oBsMJ2P/sqiuTG4Qb4fy6
	Z/JNof2tz+gtguu8kgUx2QOPksfOAtYq2s6H
X-Google-Smtp-Source: ABdhPJww2cAquBMGiXxq9EWje1LoDrQlFMTUfFZ1GWqqaMxqjFmEzX6G3W5Lrxytl3mNlL7vU5PhdA==
X-Received: by 2002:a17:902:7c16:b029:d8:ac5d:3e9c with SMTP id x22-20020a1709027c16b02900d8ac5d3e9cmr11670267pll.68.1605167540227;
        Wed, 11 Nov 2020 23:52:20 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id c28sm5720323pfj.108.2020.11.11.23.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 23:52:19 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH v2 0/2] Update poky.yaml
Date: Thu, 12 Nov 2020 08:52:04 +0100
Message-Id: <20201112075206.113124-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This file was not updated for 3.2. These 2 changes should go on master
and gatesgarth. Then we can update poky.yaml for master/3.3 later.

Nicolas Dechesne (2):
  poky.yaml: remove unused variables
  poky.yaml: updates for 3.2

 documentation/poky.yaml | 63 ++++++-----------------------------------
 1 file changed, 8 insertions(+), 55 deletions(-)

-- 
2.29.2

