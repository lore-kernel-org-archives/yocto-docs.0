Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC70BC433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 09:22:44 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.103])
 by mx.groups.io with SMTP id smtpd.web09.3664.1646990560279088576
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 01:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=wMz/hREZ;
 spf=pass (domain: arri.de, ip: 40.107.4.103, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YP9C8WWhq7j5+RNBUFbN0tJeup8fPPrWVqQaPL1c5q+HoQGORwZuq6qT9G2tnglPKlF/u+hjZMaRUzTPdigJ/mVUtP6ucZqIHqgUpls8aUqVKWxJ+MsrMKTGbLN5SgOvU8n3GYyv7Q3bOJKz7IQ4bzUOiqdxeKm8hLkhwaSOVAfF6VYWR40egsTAW/g0E+vHL7jaJ0u4Qs0W2eAmyMMvs3YHgDdv1cn2BRoP/KcniCR0j7dp2mA7iYZ/vsyIBF+eoBevAdzlKV8bacPliRz+YY67HSLkL/5/vvYkPa5zAmjV/aHcBLySXLJs8V0FwXFgJwoxLr110jkNwkEdBGjehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjRZw68+U+8RJDzX3bLZC5Si/DwmfnhZvP0uT6vR95Y=;
 b=iMXaUL4va+ynFXk112iYYdDNLZpY9qevJcMRCiaWcfsrdHiHEj90Bq29XzSQKFt3ItAwpq1RaN0OyLKHVNbBfrjKDfdzg4VSrotoiQ3EhM1RIt5NqHs/Egpn3/P8oSsDDkNLcGUgMQTCearJJIpLwNcKoLN7LmZBZB7nZ16Mxd5B8mK8KcggovLx7Rn6WD64ccZMxOeXTf1IFOOrFPVDrN7j7+SKy+u4QC0A+FRqEe2rnNqCGKyMj1009x88MPHLPY3GswIrlZfGtEDBgA3ZWMBonzhzKlyct0B3qmTgcH78aNJ7kDN8vU2iDYJpWisGVrxA80QT7XE8kDUiApzLyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjRZw68+U+8RJDzX3bLZC5Si/DwmfnhZvP0uT6vR95Y=;
 b=wMz/hREZivM1+0vS/iO2GKsrNhM8JDG3PKq0eDPQR7tOYLvwUIWp705Xf+nTiCpqhP2i/glNzQXUb89L8r4OmGFy3Elqe9SosjHjgdwhUJxv+TyWza+juyGaU4vrFUDQb+rjSIi/U15I69SW911RDHXZ6Pw5OJ9SWFRilthSyD0=
Received: from AM5PR0201CA0016.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::26) by AM6PR07MB5399.eurprd07.prod.outlook.com
 (2603:10a6:20b:8d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.10; Fri, 11 Mar
 2022 09:22:36 +0000
Received: from VE1EUR02FT027.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::4) by AM5PR0201CA0016.outlook.office365.com
 (2603:10a6:203:3d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.24 via Frontend
 Transport; Fri, 11 Mar 2022 09:22:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT027.mail.protection.outlook.com (10.152.12.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 09:22:35 +0000
Received: from dhcp-192-168-0-28.wgnetz.xx (192.168.55.97) by mta.arri.de
 (10.10.18.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 11 Mar
 2022 10:22:35 +0100
From: Christian Eggers <ceggers@arri.de>
To: <docs@lists.yoctoproject.org>, Michael Opdenacker
	<michael.opdenacker@bootlin.com>, <paul@pbarker.dev>, Lee Chee Yang
	<chee.yang.lee@intel.com>
Subject: Re: [docs] [PATCH] ref-manual: system-requirements: update supported
 Linux distributions
Date: Fri, 11 Mar 2022 10:22:34 +0100
Message-ID: <2111080.irdbgypaU6@dhcp-192-168-0-28.wgnetz.xx>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <91bffdef-67e4-2576-f6ad-3fd9cec983a6@bootlin.com>
References: <20220311084642.22339-1-ceggers@arri.de>
 <91bffdef-67e4-2576-f6ad-3fd9cec983a6@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [192.168.55.97]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a649189d-da71-408d-db56-08da0340ae00
X-MS-TrafficTypeDiagnostic: AM6PR07MB5399:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR07MB53992CB7577241F36727D9A1BF0C9@AM6PR07MB5399.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WhSe+sNghg3R27Ne5ViN7CAlAMxlvc1XcZGMbwwX0mQYEi46t448tPuxAbWSAH43LNlhtixFISS7XqgPdb1664ibb9g29pUiCwvJtDLox5JvFCuikJQy0PYvvSRH7coOlqy3VZndx82gDsJo9ltPr5R1Is3azTAeoQPq7RaLxOYNUs6DJVL5pNzLCkiXUcoPkYS9FSq4tr8mW9fyuhGIoYtiHYy8aZI6+dDLNO8l5MrjWA5S9npHnu3rJzDR7Qtn7De/FU47BLmV0B72g8lXknCdqt/k9b3BO0JgZOcp1HKylQUm9KObQB5yHwbU0GlhG6wiwHLL31Gsu1hPwPNfmtXJZaiI2g2ziOFIdpQIGK5aMB4Qk4Oul8gXwJWj+tWuo8mzil0dYjSsMQaeRIhxovyYfF5y2o3OTPJ7hUfo7yhvDHrqSkMJGvs4gH8/ZMtbOcDV7iyDZD1aY7MfsK8yFAHZLdu/za3il5iMg9VWuT1o9BydJaan31QYLM14boRODSHTPH6ZwMqvsNGS99AuKvYFn7oQS+7XPLzEy00aC4yQ0fiYE4vpgV5vH4I7ASvL/n0FLiZZvg77G8QxJyeCwfVuyM4FWRPij7s06CEdAPWMDnuJZ+Jal6VfiN05Q2GW0P3ptHRWtDLZNynwTG5JUDvNBkikC7+3isHYWSZPK9Oq6/dwLDpFumKfQwNNNk5hyxLAJfY9Op5C3Q9TkIPPGgfNvu+GrxZ6PcsSge/7QV1cnRxc3Tj4rH19yPZiKCQP8BlxZKNRuYUEu5CJRbTgGGT4SWZdby3CGrCJ+lwUhitwYqxDbh0mfIMTtqFeFktg21x8UNTyCYvB4aup82DTiQ==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(26005)(82310400004)(36916002)(53546011)(2906002)(83380400001)(16526019)(186003)(356005)(81166007)(426003)(86362001)(40460700003)(47076005)(36860700001)(336012)(9686003)(966005)(316002)(55016003)(110136005)(8676002)(70206006)(70586007)(15650500001)(508600001)(7696005)(8936002)(5660300002)(39026012)(102196002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 09:22:35.7959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a649189d-da71-408d-db56-08da0340ae00
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT027.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB5399
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Mar 2022 09:22:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2592

On Friday, 11 March 2022, 10:07:59 CET, Michael Opdenacker wrote:
> Hi Christian
> 
> Thanks for the update!
> 
> On 3/11/22 09:46, Christian Eggers wrote:
> > Align with recent changes in meta-poky/conf/distro/poky.conf
> >
> > Signed-off-by: Christian Eggers <ceggers@arri.de>
> > ---
> >  documentation/ref-manual/system-requirements.rst | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> > index 30294cb27a3e..b35dc22a39e7 100644
> > --- a/documentation/ref-manual/system-requirements.rst
> > +++ b/documentation/ref-manual/system-requirements.rst
> > @@ -37,29 +37,31 @@ Supported Linux Distributions
> >  Currently, the Yocto Project is supported on the following
> >  distributions:
> >  
> > +-  Ubuntu 16.04 (LTS)
> 
> 
> How can we support this version of the distro when we don't have the
> latest updates, which only Canonical customers can receive?
> This version was removed a few months ago from the documentation because
> of that.

I have no position about this. My idea was only to align the documentation
with the implementation. But Paul Barker mentioned the following [1]:

On Thursday, 17 February 2022, 15:21:12 CET, Paul Barker wrote:
> My understanding is that the contents of SANITY_TESTED_DISTROS should match
> what's actually tested on the autobuilder. Looking at the list in
> https://autobuilder.yoctoproject.org/typhoon/#/workers, I'd say this
> variable is out-of-date and should indeed reference opensuseleap-15.3. I
> expect we should also add AlmaLinux, Fedora 35, and maybe others.

After that, Lee Chee Yang updated the list in poky.conf [2].

A few days later I backported that patch to honister, hardknott and dunfell.

> 
> > +
> >  -  Ubuntu 18.04 (LTS)
> >  
> >  -  Ubuntu 20.04 (LTS)
> >  
> > --  Fedora 33
> > +-  Ubuntu 21.10
> 
> 
> For Ubuntu 21.10, is it worth supporting this version, which support
> will end in July this year? Of course, no problem to run sanity tests on
> this one, which will help with the next Ubuntu LTS...
see above


> 
> Other than that, the new ones look fine to me.
> 
> Cheers
> Michael.
> 
> 

regards,
Christian

[1] https://lists.yoctoproject.org/g/poky/topic/patch_poky_conf_tested/89208358?p=,,,20,0,0,0::recentpostdate/sticky,,,20,2,0,89208358,previd=1646749789423475021,nextid=1645083533053209603&previd=1646749789423475021&nextid=1645083533053209603
[2] https://git.yoctoproject.org/meta-yocto/commit/?id=a1b752d31603bdbf9b9ee4eb09b2fd6ad4ad5d21



