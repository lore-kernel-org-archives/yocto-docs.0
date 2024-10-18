Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE69D30003
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 12:37:18 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.44])
 by mx.groups.io with SMTP id smtpd.web10.20814.1729255035013851714
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Oct 2024 05:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=XUiJTB4D;
 spf=pass (domain: cherry.de, ip: 40.107.105.44, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FICF3dpXmt23gMXqWrCB0IcoZSJG2nWDMeHTz2vibdy6Yu9kvjipWmvMtJc7lLLpZrUAeqHnROrVWpsU6rRrweCK9LLwmq5Mmwt6XNR6NAS9bh4TiH+npKR3y+8oM+j4Zv6eaNGv8jExOobCBdDDMDZiBP+D6Mkj96V8uvu675WpREocbLA9Ufq6rM4TzVeYdhg/r3/0gnQFpFfm63COr7aTAOI/bnTVc/E8aL0kfdDUMMzNKmfHtSfpicYTn9XqAtPBSSONHKPSD2dzHW5uLhkCqwsNUiqmwaKA+uk5ZXqt5tlK7mnn/xokG3NzdMyo1yxU51nKJ/H8kgr2FXqsxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlEy11savnpKd4iP9gYIKAPB9ZhllC9ke9Q4dw0OJJM=;
 b=oQjov196PRDQfYC5h6tNJy18ULdPl1821HhGWt0RpUoJjkR2gYL1vWYrqmF8OllmqFiv1caklHSEFP9piZdIc7iPhhruS7XqMbKDVr5KeKrwFIN+4/G/ODoGaDyJzDY+7v13SxJqi+lBV7g3B5JQpxmoe4oRnOm1I/4ics9Z3SaHzaZkiIW0YBTKNHxvgy7SNjC7Jp/FVJ3LcW9PyUin6fF5Mu6L+xzyxarhzcTeMvLZPt/bP3PiMyO2DBRIh8rKB6jgu4NPxWERNqoRrU88gcV10XuFXntEzy1ZOuw42uEHO9nSw+vPc9aF7Q9h/efHNjSr8hO/tZBVnPoECk0AmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlEy11savnpKd4iP9gYIKAPB9ZhllC9ke9Q4dw0OJJM=;
 b=XUiJTB4DMvWecqOmiqgrfbfSkOIt7cBxAWy4pa22oZLtRz1i4mc9tNl6L1ekQHtu3u6AR2y0Qe0tUfR6PzBUYNPyW4gBdbbkNQtYWtLNIqwGGBt4szSP5P3FAGUjhMpLKwEjTnN6TpOlDdv6uPgV9sMV4oX+Zn6gIKHwYJnjgrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7380.eurprd04.prod.outlook.com (2603:10a6:20b:1d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19; Fri, 18 Oct
 2024 12:37:11 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 12:37:11 +0000
Message-ID: <a12053eb-d666-4e9b-ab7b-003a3805c25c@cherry.de>
Date: Fri, 18 Oct 2024 14:37:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] overview-manual: concepts: add details on package
 splitting
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241016-bug-13225-package-split-v1-1-20681130d7eb@bootlin.com>
 <3afd2cfa-cba6-4f6a-8075-698850c703ad@cherry.de>
 <D4XY661A30GQ.3E4DMVXPCZRZ@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D4XY661A30GQ.3E4DMVXPCZRZ@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR07CA0292.eurprd07.prod.outlook.com
 (2603:10a6:800:130::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d7fa27-934b-48db-6a18-08dcef71961c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cHNhMjVzTW1Bc2d4a2FPTjZiRzNlM0h0SDdqanJDVTV3enhSeTRYNC81S1p1?=
 =?utf-8?B?UDcrNFQzQTVLT2puY0pIbEFiMlBhVFBqMDg1V3lmYVVFbWo5aGNPeTJDc0J0?=
 =?utf-8?B?ZlB3V2s1Y2tIbklRb21xUGlDcS93MWRBL3VrVEh0ZlNITlY5ZERldVpmSTAv?=
 =?utf-8?B?aWhrN1lwemczNXdPcXAyWVRSUFlhRnA5NEwvU1Y2UkxONWNnNnNVS2k5TEFK?=
 =?utf-8?B?Nnc5T3Vyd0ZxellTTXhaRlh1amdRek85d2tNT2Y4VmtZeFpHZDBnb08xamU4?=
 =?utf-8?B?Z1V4QkQ4Tyt3RUQ5ZksyczZJVXJMQmNNSWdjTVRUWFVXOW02dWtrR2JvSmtT?=
 =?utf-8?B?UnRSMXhURzcwbFdTY0hhdG5FakJrWW5hT04vdVMvZWZ6NlRsQ0FSWTZZbGtx?=
 =?utf-8?B?ZWNQaHpVc2VuZXdVTmVNd3c5c0I1VThURy96N1BQWGFpYzY1dWl0NGVWYU9Z?=
 =?utf-8?B?VXJEK2xrTG9JNWtOQmdDY0YxbkZybEgxNWVpL0thT3k5eDN3ZG4zTW94SmNu?=
 =?utf-8?B?YUc5TjNWR0tMSVNRaUF6VUgrT3FQVUFGRVNhOEhjSkRTMnZ0cHduRzJWcWJ3?=
 =?utf-8?B?WXpqSVFMN0crcWVFQjM5L3dkVzJDSnFpVzAzWnlxU3BlVDZwdXFrbEtsbDFD?=
 =?utf-8?B?YjdmTXh4YVRZZ2xiZ2dYemIzU3g4Mk5uSlBOeno5SExvMDFHL2QvMnMvby9s?=
 =?utf-8?B?SVdRaDVxMjlCZTVBZXJhZ0FLN0k3OEJscjBGU3JWTlpIUmtqZElGWDFFWWZy?=
 =?utf-8?B?dGFpRzZIT2ZxQ0VHbFpKM1V2MXAyeUZxZ1FXbkk5aTBob3F5N2lsMWgvTGhr?=
 =?utf-8?B?ckc0ekZkb3JKamowQnVuSUxsMnp1emRQUVNsM1d0NTRUdlN6cURyRmx0ekx1?=
 =?utf-8?B?anNnVm1Cb0t0RFRRZDZNUVFkNUkrdkMvRDdLTlhOWlRveXQ1VVNnNEhjNi95?=
 =?utf-8?B?ZTRGRjZId2o2bS9zNUpLdW1tVHo2WmxKTnRBbDlnQ08ySTRBV2ZoR3FGRDYx?=
 =?utf-8?B?NjdnZkVQbUxQc2dxOHNGKzQxZ2xOUGdySlBoVXNuZkh6bFA3R0dFdThka1Az?=
 =?utf-8?B?ZlFJanp5MEJSQlNLRmNaa2ROQSt2UWJQcHhnLzg3Yk1iSjNsZlNiYThabnpn?=
 =?utf-8?B?alE5VkdiZE5WMFJUNElQd084Zk1YMWVDM2xmWkZ1ajB1cTRiaWUvTkllUUNY?=
 =?utf-8?B?SG1MZXlkWmg4K1dIMmFxb2NoekZHWVI2NkJpUzQ1amh5NjBOZzRFMWhNUldk?=
 =?utf-8?B?QWRJQkN2dXBQZE10ekdsL1lVanV0VjJRQzVmUFVtWmtjRzVBTm92TjlQVldH?=
 =?utf-8?B?bjNFM1R0b3NIK0pXQURnd2JVSjY3TWZXTEw0NjVPei9iTnY4MHF2ZmUrek9o?=
 =?utf-8?B?YmFjYWNFWGRtZVNybzNNRUZRRWNuMFRRWjViM3hlQ2pzWVNQYURTZ21heWpl?=
 =?utf-8?B?R0ZyQm5ncWtHbDVESzMrNkZqZ1dRZUdsVUZvSEhCRWVyS0haMEY2eHE1dCs4?=
 =?utf-8?B?TUlWRUN6NHQ3cGV3eDhmbUpmZDBwMC9OVFFFVVZnaTVKcVFLRlV0NWM3Z3VJ?=
 =?utf-8?B?dnpiRnQzcWpxdTE5bDlPRmU4UzF4RW9jSXROQktTWkFGL3B2TXVpZzVDNFB1?=
 =?utf-8?B?QXV3SU9jTTNTbkxaRFgvME9lSW1xaTBZOThuZmtLWThNZ3BlR3d6TGt4TmEw?=
 =?utf-8?Q?A6Pd45CVBAnUocqpl4x0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WDhMQ2FsbVkxMDR0RStzdkI4RGR1ZGVoZW54aTE3bGZaUit2Q2lrOVZNWmlD?=
 =?utf-8?B?ZVFEb3h3ZW1oV0g1SEJ6UkJFbmF5b2lQb3hIMmxDTTZJRjI0eXZNaTBrZERi?=
 =?utf-8?B?VFpJRmJPc0tFV0ZuVzA5bWR1bDI3VUZsbG1QdVEybHdtdS9PbnF0VnQ5Qm5D?=
 =?utf-8?B?VjZQLytiWmF0Qkk2MUxzQVNJckx0QTBUMGRWWWZZZmYyMkxuTVZTWHpndVhH?=
 =?utf-8?B?dG5iTHpIcEd0czQvdUZocHBQc2UwTHhINUs3Ky85SFhmUm1HbmdPRGY1dnBu?=
 =?utf-8?B?TGxJZU5oYWRESUZjUjRHVnIrMThza1lXemI0N3RCdXQ2NGxSa3pMOVI5amdm?=
 =?utf-8?B?clJmSHI3OEY5MUY1V3kvRzh2Y29DMVdpQTdIYjRlRWp4eFdLWjRON2g3b2ZF?=
 =?utf-8?B?L0huNXVPOHdqaVNGRnM5KzA0S3JQK1FhWFVZT2tGM3lTWGhRYlV2TkQ1YVZJ?=
 =?utf-8?B?Z2pqdkdCcEpqZlhVSzdtUUN4aGJtZkRmT1lBY216SUdkTTBhMW9ObVh5ZjVK?=
 =?utf-8?B?ZGtoMnlFYWxTVWhGczIxdjUveEh1NFRSaDRIazI0QWhzVzllMlpOZFgvNmV5?=
 =?utf-8?B?TjVNWFdrNGltS0xITm9ucWFrRUJYMnVyV2xZMlY3Z1hPZW9RYmtjNThvODdE?=
 =?utf-8?B?K0F3Um5XcFpPTzNiclR3RWdLV2ZTMzBBdDRTNXRIa3hGRlZEbTVhS1VMZko5?=
 =?utf-8?B?RDhhaXJoczlteXhYdkw4eVNJa01SeWdpalFYSTd4d1Uwbmt4emtWbkh3N0tO?=
 =?utf-8?B?MXdqdFEwZ3c0dXhJb3A2NGhlT3o3Mm1TV0k2SktHUjA2cmZlS1NQUVdxUnVt?=
 =?utf-8?B?MklrdHJWN095eXpHaVFoYkxzWS81YmJ1VDRDK1plSFdKbCtPbzVYVGZ6QXVX?=
 =?utf-8?B?LzVBcDFZREV4U1ozUWl3WEcyNFptTURZdmx0YThuZHh2N01nZDVicDZTUjR3?=
 =?utf-8?B?SWhDakppZ2V5UU55WXluWGFEZVNvZ3R5T0FlYVJaaVc5R21qRERaRy9GTnM2?=
 =?utf-8?B?bmhIR2drdXE4Ykw5UC9kektEOW0vOEM0a2hwS0Q3cnRFM0xzNG1LSUFqZjc2?=
 =?utf-8?B?ckFPZWpRdlpqNDR5citDZWE1QVZyaGwvaFdnV0hPN1FWcGYyTkRDcEpyNGND?=
 =?utf-8?B?OGlCRXNGS0Jpak04cUNIYkR0c1hSNHpPTUtSLzBtVGlZTDFjQk9TeW0xK1Ra?=
 =?utf-8?B?eWlFOWlqUUhuc2hmVGFaeVh2QitWMW9zdStZai9GajRvZWFnYnJJNUo2WUpI?=
 =?utf-8?B?YXY4cFdoa3o1MU1GZjZJWEdkOW5uMFJDVHhyOVcvRWdCMi9OOVdoajZKaUdm?=
 =?utf-8?B?YlloNVFkbUJWUExtb1F4UkcrcHZudmIxaTk4UHRTajRoU0F0S1ZjV1cvWDhy?=
 =?utf-8?B?NGtTbmpqYlBFQWxUaVI3dGpYdjRZQlhUOFBzdGdRT0l0dmFqeDlaOXFvS3pW?=
 =?utf-8?B?NjVGZDhIMktGYmxsR1NVTjVYeWdYUGErYVBWY2dEVStRZmVyREFCMDgrUkUw?=
 =?utf-8?B?TExIejF2ZTgrR3Z0QVV3djZJR1pLTStXNHpxc2tINnBrS2ZzdEw3c0FscEVm?=
 =?utf-8?B?NXowTkIrbnFKSUNKY1VXQThZV1hROXpUbEZQMnZzMlBtNWNqNEZyV1FzaDhj?=
 =?utf-8?B?aWRQdUxOVC9kcjZzeTRHa3BKWnZMTG5EeGRHWlNnLzlLdlluM2NBV2JIOUpt?=
 =?utf-8?B?Q0l4UnNqa0NlckozdkZzRDFseDFSQzF4VGUxWmJBazlSbFVqYzNrVmlkWFUw?=
 =?utf-8?B?TU5Ra1A1dkt4eVVaTmQzQXIyWHhBTnNuWmh4cytJZXQzSmNEV0V2NnhDdmVh?=
 =?utf-8?B?dG1aNzB3K1lqRUJMc0NzaUlueVBYRnZDMnFGdFdSbVBpY3NxcEJueHdudWQ5?=
 =?utf-8?B?STFJMFUwYWt4ZmNvbng2K0grekcvNWprd2dINTU5V3VlVHFveUJLTW1kREM1?=
 =?utf-8?B?ajk5QzBmVThhbndnU09zY2xqNUh4V2FhRTJyQ3U0SjIva3NXL0FsdWxWcXBT?=
 =?utf-8?B?RGlWaHVxMFVjU2x2RFhEMStVRGMweCtXQkdCR2Era1dsYlB5R0g4ZkhLT29x?=
 =?utf-8?B?a0xaSU9pdXZ3SFMxZFVEdWhvaVdhU1NBWGxja0ZDOTVQVFNpZzQvSEx0K21O?=
 =?utf-8?Q?UXdT772F+FAk8QnbWXX9Tqg5S?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d7fa27-934b-48db-6a18-08dcef71961c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 12:37:10.9662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vWDpPd9Fhb0pxSY733sZoXrKF7jsf1FzJGPDXu/YVCLhw+9hc0cuAp3pjqRjGdSV85ynU9a2Bt3rEF62ONgolMDF6MdM7adThfCGhavIjmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7380
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Oct 2024 12:37:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5537

Hi Antonin,

On 10/17/24 10:44 AM, Antonin Godard wrote:
> Hi Quentin,
> 
> Thanks for the great comments :)
> 
> On Wed Oct 16, 2024 at 4:10 PM CEST, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 10/16/24 3:19 PM, Antonin Godard via lists.yoctoproject.org wrote:
[...]
>> Additionally, I think PN-dev does not represent the development variant
>> of the main package, it represents the files that are useful for
>> developing an application depending on PN main package. Using "variant"
>> seems to indicate that PN-dev could be self-sufficient and potentially
>> have the same binaries/shlibs than in PN but compiled differently.
> 
> That's correct, 'variant' is misleading here. In the end, what about:
> 
> """
> For example, the package ``${PN}-dev`` represents files useful to the
> development of applications depending on ``${PN}``. The default list of files
> for ``${PN}-dev``, also defined in :oe_git:`meta/conf/bitbake.conf
> </openembedded-core/tree/meta/conf/bitbake.conf>`, is defined as follows::
> """
> 

Looks fine to me. A small nitpick here is that it's not necessarily ONLY 
for ${PN}, e.g. if we have more than one package containing 
binaries/shlibs. But at the same time, if a recipe has multiple of such 
packages, it could make sense to have their counterpart in -dev, -src, 
-dbg as well. Anyway, just a random thought but I think this is good 
enough and not really misleading :)

>>> +contains development-oriented files only::
>>> +
>>> +  FILES:${PN}-dev = "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la \
>>> +                  ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
>>> +                  ${datadir}/aclocal ${base_libdir}/*.o \
>>> +                  ${libdir}/${BPN}/*.la ${base_libdir}/*.la \
>>> +                  ${libdir}/cmake ${datadir}/cmake"
>>> +
>>> +The paths in this list must be *absolute*, and must use the path prefixes
>>
>> There is a very important piece of information that needs to be added
>> here and a source of many newcomers' mistake: these are absolute paths
>> from the PoV of the root of the filesystem on the target, NOT from bitbake.
>>
>> Indeed, in do_install (and do_package, etc.) we need to prefix our paths
>> with $D (and $PKGD/$PKGDEST) when installing/packaging files, however,
>> FILES doesn't not need those, even more it should NOT have those.
> 
> You're right, will change to:
> 
> """
> The paths must use the path prefixes defined by the
> :oe_git:`meta/conf/bitbake.conf </openembedded-core/tree/meta/conf/bitbake.conf>`
> configuration file, such as ``${sysconfdir}``, ``${bindir}``, etc.
> 
> The paths in this list must be *absolute* paths from the point of view of the
> root filesystem on the target. For example, assuming the following path is
> added to the :term:`FILES` variable::
> 
>    ${sysconfdir}/foo.conf
> 
> In a later phase of the build system, the created package will be used to
> install the file ``/etc/foo.conf`` on the target, since ``${sysconfdir}``
> equals to ``/etc`` (unless explicitely overwritten).
> """
> 

Note sure the last paragraph makes a lot of sense in that context, I 
would simply remove it. I realize that I may have mislead you in my 
suggestion, it was intended to be a justification as to why I think this 
mistakes happen often, because we often have an additional variable in 
front of the path as one would see it on the target.

I would add a note to make it extra clear that ${D} should NOT be added 
to it. It's implied here by "omission" but I've seen this happen too 
many times that I would really suggest adding a note for that common 
mistake :)

[...]

>>> +file matching a pattern specified in the corresponding :term:`FILES` definition
>>> +will be included in the package and *excluded* for the remaining packages listed
>>> +in :term:`PACKAGES`. As a consequence, custom packages should be added using the
>>
>> I could suggest:
>> """
>> A given file can only ever be in one package. Therefore, the first (from
>> leftmost to rightmost in :term:`PACKAGES`) package for which the given
>> file matches a path from its :term:`FILES` will contain the given file.
>> """
>>
>> Still a bit too complex of a sentence but couldn't come up with anything
>> better for now.
> 
> How about:
> 
> """
> A given file can only ever be in one package. By iterating from the
> leftmost to rightmost package in :term:`PACKAGES`, each file matching one of the
> pattern defined in the corresponding :term:`FILES` definition is included in the

s/pattern/patterns/

> package. At the end of package splitting, all the remaining files are stored in
> the base ``${PN}`` package.
> 

Is that true? I'm pretty sure you get a warning/build failure if a file 
is not in any package. It just happens that most common paths are in 
FILES:${PN} but I don't think there's anything making bitbake have PN a 
catch-all package?

This would also mean it'd make no sense to have a package listed on the 
right side of PN in PACKAGES, but that's a valid use-case for anything 
not matching any prior FILES:. But maybe I'm misremembering :)

> The result of package splitting is stored in the :term:`PKGDEST` directory, and
> contains one directory per package.

Not sure if that isn't too advanced already for something in the 
overview-manual.

I guess we could tell the user how to find out in which package a file is?

oe-pkgdata-util find-path '/etc/foo.conf'

should do that if I remember correctly.

> """
> 
>>> +prepend operator (``=+``) to be prioritized.
>>> +
>>
>> I am not sure it is wise to say "prepend" operator as we have three ways
>> of prepending:
>> - =+
>> - =.
>> - :prepend
>>
>> But since you explicit which one you're talking about, I guess it's
>> fine? The bitbake docs only says "=+" operator apparently:
>> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#appending-and-prepending-with-spaces
> 
> I think using the "prepend operator" + showing it in parenthesis makes sense
> here, as newcomers may not be aware that it is used for prepending (there is no
> explanation on operators in this document).
> 

Fair enough.

Cheers,
Quentin

