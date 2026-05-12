Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A091ACD4F21
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 10:54:37 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72496.1778583272343072949
 for <docs@lists.yoctoproject.org>;
 Tue, 12 May 2026 03:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=QGU3Sotd;
 spf=pass (domain: cherry.de, ip: 40.107.159.14, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkMHfasYmzViYdrxPVjDHX2pXOwmgnEK3rAvJ/53ns1i2OKp64GW5DWxpERJ2Wr6mMTbLAP85TKAvDmL1IoeQkR9cVW/uh/sEDhWZCSPQMQkyCGqN7EvNsV2bXXc1VuLXzjbfLQv6MkfUW0Mh1MCwNFJ5ismWQZviV5qGvuIznq3WEi1CadDGrMLQys4mGRNE8FWLKg67/0Rg+FOByuIsrZDnr0XKUuX2UvieUPWwXizUuc9HslARGJ3X2MRo+bWLfFy0MGGDRUsYgx2+RzJqOhTGBEtU2u+A5brxpbKBHS4Jqq8qrjkMY0btHJgL7JusV2FbZhvyhUKIJwUdUKHrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJtBAattDMy3XO5Ha0unD5LYhpcFBHSSPV5W9hNBPLU=;
 b=x347UqrMhe4/ppHbljdYEC7byXnmo6TsAlQor38hre0gVdoKfX3/Dcfpixe8pyhYwfjmRoJlRZDCxevFnynjXfDUPkNHkCYFOA7R91KtT61JKVluhv/MH8qUwJpWOqPbrV3KtO0V+zZJvDLfGZbPssvADjFlVcpkrBHDwgKKnczSdClazMsfoBmrC8R2xd0YJQ5+/Mw6binjGS5oRw+eMwhSY2GDpOvMHzhH4KEHXg7W59c3RdWPLK4XlgKwKJFM/Wc0S8ANEgg5fd2QbkxYUFBXeY/d5CE3ULo1B1bamGFb9JwlP2zVbELl4iMby9LoMMC2Ke9xJWAov8OKM7AfuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJtBAattDMy3XO5Ha0unD5LYhpcFBHSSPV5W9hNBPLU=;
 b=QGU3SotdpIsenu3ucuYjahPi4ria2qXcPa9p4ukDHZhrEHGFFKGpadR+eCV5IR7q3p1wVNtssKYw58XqdDqQq6xSvoqePsWX11jkVNQp8WN+kkapi9XUFvbVGJy1B/gWuDljO5fWabx1Aw/B2TsLA3csgNZ8zCDC60H9gYwj4eE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PAXPR04MB9596.eurprd04.prod.outlook.com (2603:10a6:102:23e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 10:54:27 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 10:54:27 +0000
Message-ID: <3115d9e8-2e45-4bf4-af6d-34fe228fc51c@cherry.de>
Date: Tue, 12 May 2026 12:54:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/variables: document the 'dynamic layer'
 concept
To: rpjday@crashcourse.ca
CC: mw.choi@telica.co.kr, docs@lists.yoctoproject.org
References: <20260511093446.2350-1-mw.choi@telica.co.kr>
 <0dfd7a48-266b-48b8-b3ff-87b26ce60e45@cherry.de>
 <44a71923-cc55-c9a9-f35a-277eeae529ff@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <44a71923-cc55-c9a9-f35a-277eeae529ff@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR08CA0247.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::20) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PAXPR04MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: b47edbf8-214e-4930-e837-08deb014d645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|22082099003|18002099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	5Eb3yj+0tAtq7CTFlC2OlMtFnMJtBMBEaXhhBenC5zaA8Vu7dsch+SloNwcdyB+/tFUGpQl/nc551Pnx3L4PI3OBmiOqc8RRjK6i4c7qxuqb4nSJ3xYzaZCa9G7b3AVmyumKA3IdRmXC45waFdBJgeamcoBFQdioFzCXlxs2YrUZK/m+mmFUQ1M0M9zxKM4ssMiNaSTkfijAtKuahC4GtKFssEBlN/xpl+S3cEdRM6z1gMgK5mflsIDjE/QJccK6Vi7JJRBVmAnKLD4cl5FSp2zb6RiE2ozPwUOzdD8IyHo3acGCbNGVQv+JYesu4ClVUSnf7DkCVaXIpdTrYD8H7jU6BW9FWmamsESTJlmVmLG+Ppku4eVjTtdsv49iJLXW580YFUjMGvWwrD3+Q7KJdFBpyDPQESr2STr6iQTvjercIPcoXo0I7vVbZ68k+oJJG/w/c7L1hBp5i9sQFDONPktaFcoklpaHbPfJX065vobeLkNo+/uTHuVyFedRtlxwMxUTyk/ziJwKba9MhRbUXRH7lAyVOGhs0ozXwqPR6IY4G5juMNrhuJcWGidIhZw/ifNgYJ1V1LAoIS+x9kfCHWlOST58NRQqIkT/AhK0KzOm1jYNdiWzzUFt7k3FzEr/NdHv8V0iRHD9GLuaoHb+yoTQaOXSxW6PWigUtodu9+1dQYa3pKmPhob9n1cNf+m3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(22082099003)(18002099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?R3s29dtVBX0BEdOGjTByIrM/YAY3LhuOC1ttoQMrGqQcsgUzaTjuJSUKfS4q?=
 =?us-ascii?Q?kXYytPkuWKIinePZVv+UWyiP7rNCdF9YfCmKg+dvxy0HbLPD6WMld59Hq9I4?=
 =?us-ascii?Q?XUJ5ykZRQ+CERf3K4SUFboa5zyWUoa0YzwplhzzgM2LixE8smGNU+3xHiBK3?=
 =?us-ascii?Q?lCFM4SJBNsf0DfU9Isd6/zuhl2fdro7yoWCaChddNNuIvhaKs9ugXbSWM60w?=
 =?us-ascii?Q?6zYY79/Oi+LAX2qYToDBWa0xA/FKE/Fa7r0d0j8acotasdxxe8PCchs7VEJ0?=
 =?us-ascii?Q?Zai91mFtcmBhVeRupibBck3WIp3M34Z2yS24i73YMhukzCeX7s8HW8a/a+6w?=
 =?us-ascii?Q?Srt1Rdyt0ZeydmSjPT3euKBY1L06NhONTn3qFwW2L9o9lzUMf45IIh5eK34h?=
 =?us-ascii?Q?HuSBMHVufwqr+LjQHwtr0EuGyZmMoH+KDRHHGLiV9rD0SeQEVRi6sW9iWx0v?=
 =?us-ascii?Q?HlOwYvR0stQRHgxVue0hnIL3MoIsmO8fJoKu/1Fce9jpMoOiIn3BYD7P9/AS?=
 =?us-ascii?Q?Ql4yl5bcJ3Qxt3q1aVBX8DMwOYpkw6UKBMTsusBFrjMRXyBDxqZN5MtvLh61?=
 =?us-ascii?Q?n6d0MKAOXgSf78w61JqKJ8awOeux/1HvHXzhfeeTW2flskMproDa9qxvGwKm?=
 =?us-ascii?Q?itIMQSJ0iUI6UwnJB9aY6TxZHuuvexxIrDf9R9hIhhyYd0D0oglFfxTz8zxE?=
 =?us-ascii?Q?P0XfgBSDibNAMDo6azfWOCB2MMlbic24NJzeJ8D3JvkR18D+bu1ScgeXAU6J?=
 =?us-ascii?Q?2Fo/XO3JIUWasEh/vWPs3TWGdJkTIqdKsPR0gIxez+tdp/JVNHBYsH1OFznp?=
 =?us-ascii?Q?8vk01wo7Czu9gSQwzGxHdoIdNJRs2W+xv/MZ1Vxaw4m5w2PL85km3wsgk67V?=
 =?us-ascii?Q?gnrq1sJ/vizOf3LAWjqjayqThRWTvthYWJqc9x5tow4mphIX5yMFZGitpFxz?=
 =?us-ascii?Q?L7r+dVkwYuAdqknqBCohR+f/NV3us1tfaS2hJqzp64NzzheQQpQ9n4VEJy3m?=
 =?us-ascii?Q?cqRO+tW1KM1HTStYC0CyKMR063u4jieay/FfbXxW1rPbE1msMSLdKU4ETQ1g?=
 =?us-ascii?Q?EwM7XE908M81pR4HKaMm6aFjUSTar7agzwD6OIZ5ojY6TP+/w+MB9srKEkBJ?=
 =?us-ascii?Q?UosJDWU3E+1r30/ym3P0QtI3NY3kZfCDA4PojOGIdU58NjVepMdA1HG6DARK?=
 =?us-ascii?Q?Myel06dIcvCy2FgBLmC5rCY4wcvaK3Nm93UgqVdwzEJtMvQSQZ3rKh+LvHGc?=
 =?us-ascii?Q?OgZem4hcF0a91JZ10yqfGjJcQgXutcz1RA83R2WZrHcrTLA31ek8Y1iSVo9N?=
 =?us-ascii?Q?yPaNppF0Ge+MlZvIaAWHGuGmBh5UK1uyOBE9pjsBqg/xcT5OSAZH2uc2gyFA?=
 =?us-ascii?Q?W5E0VvnTqorUuHFDvHVXNiOZYs0xtNG3yrr6h9Em0uDlfAgP49RVJyWclCVl?=
 =?us-ascii?Q?hmyR73weq4SNG5P3wVRzDitdKhpZ3iXDOlwUlvWgNHmjYsHUs8cKI0+j73kj?=
 =?us-ascii?Q?gMHj6xoiDE204AJAiuc+uJiXJmWZDf1f1huVAoWigI6Jzxa3xHR7Na69qruR?=
 =?us-ascii?Q?4Jv3gZ06G8Ud9QtNFxwhKbdcxZYffIlO/TxK4szj6H31WXGi3TPxXJ52dH84?=
 =?us-ascii?Q?S/WoUjSmH+68eTCNBBAOpv7jhZSeJW4ypR7F77WRNde+iv4hWjxUqRZnsyjQ?=
 =?us-ascii?Q?E57W5tFSJDO/zORGAzOQX8sHk1GGZIRyToY7gLIh+JJuZDLwAhJn9KDeWnOE?=
 =?us-ascii?Q?WfC3ziDnmWDqjXUdyJzhHGrU9RO3s2ijGuNE4fF4QCsAp9FGmuH5v9wUgz+B?=
X-MS-Exchange-AntiSpam-MessageData-1: 6aZvdyyOnM8LU7xDbBOGdVXQAXAGQl96Wm8=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b47edbf8-214e-4930-e837-08deb014d645
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:54:27.5196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: icwOCvOTY74/I6D2E2xAPrkJFpAbeluupAkiPy12qvSrC3f5E9n9Q6/lu2ThWd7e3R/SpcW6W/Wi+9g+foFriyZzMr1NdA7YLBp2qKsT4h4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9596
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 May 2026 10:54:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9461

Hi Robert, Minwoo Choi,

On 5/12/26 11:52 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> On Tue, 12 May 2026, Quentin Schulz via lists.yoctoproject.org wrote:
>=20
>> Hi Minwoo Choi,
>>
>> On 5/11/26 11:34 AM, =EC=B5=9C=EB=AF=BC=EC=9A=B0 via lists.yoctoproject.=
org wrote:
>>> [You don't often get email from mw.choi=3Dtelica.co.kr@lists.yoctoproje=
ct.org.
>>> Learn why this is important at https://aka.ms/LearnAboutSenderIdentific=
ation
>>> ]
>>>> Signed-off-by: Minwoo Choi <mw.choi@telica.co.kr>
>>> ---
>>>    documentation/ref-manual/variables.rst | 5 +++--
>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/documentation/ref-manual/variables.rst
>>> b/documentation/ref-manual/variables.rst
>>> index a8cbb87cf..755929947 100644
>>> --- a/documentation/ref-manual/variables.rst
>>> +++ b/documentation/ref-manual/variables.rst
>>> @@ -841,8 +841,9 @@ system and gives an overview of their function and
>>> contents.
>>>          previous link.
>>>
>>>       :term:`BBFILES_DYNAMIC`
>>> -      Activates content when identified layers are present. You identi=
fy
>>> -      the layers by the collections that the layers define.
>>> +      Activates content when identified layers are present. This mecha=
nism
>>> +      is commonly referred to as "dynamic layers". You identify the la=
yers
>>
>> Where do you see it is "commonly referred to as dynamic layers"? I canno=
t find
>> it in the docs.
>=20
>    Technically correct -- you won't find that phrase in the docs, but
> that's how everyone *names* those directories. A small sample:
>=20
> ./meta-intel/dynamic-layers
> ./meta-ti/meta-ti-bsp/dynamic-layers
> ./meta-rockchip/dynamic-layers
> ./meta-raspberrypi/dynamic-layers
> ./meta-freescale/dynamic-layers
> ./meta-riscv/dynamic-layers
> ./meta-ros/meta-ros-common/dynamic-layers
> ./meta-virtualization/dynamic-layers
> ./meta-python-ai/dynamic-layers
>=20
>    So there is certainly an *informal* convention.
>=20

OK, it'd be nice to mention this in the commit log then :)

If it really is that widespread (do we have other layers that have=20
BBFILES_DYNAMIC that are NOT using "dynamic-layers" as directory for=20
storing recipes/classes/conf files when a given layer is present?) then=20
we should probably update our example in the same entry in the glossary=20
to use that directory name as well.

Cheers,
Quentin

