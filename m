Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5669C54F64
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:13 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.57])
 by mx.groups.io with SMTP id smtpd.web09.27106.1650874853524476919
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Apr 2022 01:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=qYVODD+U;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.3.57,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BD+Hm1tS8PuqbjP/cZ9QSgYybPX+1a03GQ5et6/n2YqDEKvmXVrk2HiKAg+ajVSWtDiXgqHzPamVGF6agT5s9CPcL0A88Km+mYbgU4/xNatDYmTfshlNbewVKV+xqa2cOm83Sst4z7dJjSkKdDGSP13f8FAOB09JTEJcqYRsSen+dTNfa9MK/k2R4vhbJzQIyD5FwkEeQJYuZzbQs4hB1vUvuwTyyrm//qqeaDo3tRCZFMuJeh/ItWrJXL00NWEzG/zZauAhH4zlJeXVYWeEaUNDXzRYmATpNplTQwEiGUWXJo0zqZfWHtygah3Czu9QpfkX2mszMKltVSsosKnfmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hw5H2SAFw1ace7rSiuw9RV3YyNOYrVoL1ziLikJ8X8E=;
 b=Rq9g8dG7d+FkUnv1ftiL6IU67YWTYhYB7/cWdWJDeIYHstTKIr8NSVSaZge125qoucGxY/gY9KvAEXG6L4MPngLMd4dtpAUY6vJCHI3HQXg2pxEkkt8J4pvlK5kFtn2DUWMoFCaga3r9aMDFHFhho7pRgg6PcfEGMwwHa2mT9+XrrhAaZCKLEefnDkxAESr1xl5x55wycS9UwrhY7gmBfKq98+Oz96aexKhN0CVBYgHI/VcKYyIXEOBclwNjqDG5vuLz5lznkdTSGG/L4W0EKnK1ife+lvBywepNA95W1dRb1BcQw2Fipi7yBDgKnWsv1bwWsReQyy3EsOWz+nw6ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hw5H2SAFw1ace7rSiuw9RV3YyNOYrVoL1ziLikJ8X8E=;
 b=qYVODD+UySqHr5eudK1Ef64P6U2tORTYxN5Ox7d1RGvu0iIeo7xsHIayKD7XKJQezgZzTWb/9z1UprNz5pfFGU105y+dVtKMuHnvHeOs4BoMBkIH1Rqs569qZOsLtdmaBymhx8mYnok8IIYLBgn/9+Qjjfasl9WG4mZ9m0ydRMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM0PR0402MB3492.eurprd04.prod.outlook.com (2603:10a6:208:1b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 08:20:50 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979%4]) with mapi id 15.20.5186.014; Mon, 25 Apr 2022
 08:20:50 +0000
Message-ID: <f379c869-bf36-b895-0b80-67da70311fc8@theobroma-systems.com>
Date: Mon, 25 Apr 2022 10:20:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [docs] Alphabetize the Required Packages for Build Host?
Content-Language: en-US
To: Tim Orling <ticotimo@gmail.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: 
 <CANx9H-Ai+s8euDAX4nf1kt16DC5Jya6a0ygQO=6Ryv48Z1de3Q@mail.gmail.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: 
 <CANx9H-Ai+s8euDAX4nf1kt16DC5Jya6a0ygQO=6Ryv48Z1de3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0065.eurprd02.prod.outlook.com
 (2603:10a6:802:14::36) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 687a61a6-55d2-4c3e-aed5-08da269481b6
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3492:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR0402MB3492661A85EF2DA84CCAB5AFC2F89@AM0PR0402MB3492.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MICNv63mDhPrPXiAi1S1dAsDeIFbWv5UyJjt/zeInGCaDedQ6qY/GiVEwHaGzQnthkHaEV1rqO7FoaZnsHRb9W3hi5h1tOnYZ4cwwByR+9hS3TkMjJBCVjxnyONbxzMSG8/mXrRz1INkqU3aaRHa1mjjCQWR1W0IVQ0qKq+WnhJOetJIyrqJUZrqfQ7VpJ8KUGZzIAJPWjeN1FOG8YPydOJr/kGUQmXZF+OIFc+l1WsjvMpvlVhD7LNV/yKrGlwkqpcv4yyH/Cutuh0n5EysxOG42vvESVL8dDU+dNLMbw22wHlPeBHLziThfSfSTXle+MAk+TaZEY5K3t/gzgJ13iYzcw2ivdzsDMnKtaLL1odap2ULsKteMv5m/W2bs0KIYqSM8SADg5N+39i1kD9DsOPOEgV15Ts2TwExba0gVeJAmCH/JAc9/UZRu6QMt9zNKrkfDZ/E0gGGCzEE92jvieIN4SKB+E9Dc2wYMiUyyFCMwS2HOIUJPOsaARh6hZfdKZoLs40JQ0dmFUvhBA3WEP/IRSk6KJ/bAZri2ppAtsB3LuhHEwWMPzNpIxJY8Oa24ZhRRdHYAu7xe6IUV8hoUHlyOULzkZtv1Xhxlrhotz8fWN93iOtXsxCR5aal2LPArKM7wer7CL9488diJjlSpU/oLgw5kX0ph1+sRARbRS+1SHaD43wfofzXIYr4uRLg6JftrIH3VYmS5CbY+cqwgrdEbjJ6QZoeMk5kLJo51+mPlYhEWgNo3XgbnwF5pZBlqHTZTkrmQQeP7W+7JoBsQV9hbsyN9vFpkQZxdu9R82o0VyPlM92vL1ox+kUzzAnt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4744005)(44832011)(5660300002)(66556008)(186003)(8676002)(66476007)(966005)(6486002)(110136005)(36756003)(31686004)(8936002)(53546011)(66946007)(6512007)(316002)(6506007)(508600001)(83380400001)(6666004)(2616005)(38100700002)(86362001)(2906002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VENtUElSWXBLTkcyUVlTY2RLM3JwbVF4MXVNZmdtbHFoTFBwL0Z0WUhOUGtS?=
 =?utf-8?B?UlRZYlpkM0Y1Umo0RThJeWNOOXhyT3lJVWZNc1pYbUhKVmNoUjBHc3ZZZWtl?=
 =?utf-8?B?WHFCN2IxS3doRGJEb1hTZ1o0VDhxMVVQRkI4dmUySENiZUNJY3QzT0E3bEJ1?=
 =?utf-8?B?Y0VleUUvcWVZRFUwWHloSGs4dGhnOUs3Q0t4L0JPMll2b0prTUQybVJuSFBr?=
 =?utf-8?B?NXZiNko2RERXMHNTTDNFMUF1R1lEVUZLd3UvYTNIdFQrc3lwOHYvcVZFZDEz?=
 =?utf-8?B?b2VzelVaM01xQzFDb0pWUjV2SGNXckdCV3lxWlg5eStUUkVveDhURW9ZM0VM?=
 =?utf-8?B?R0pwaXROVUE1bGRtUjYwdnNHd3I1TWc4NVk2a2M1SnNXU2FZa25kckI0ZTRR?=
 =?utf-8?B?Nm1leUZWTGsrWWNLbVB5V0tBaHRjemRmaFBJRVJLUEZzb0RLancrN2tNYjhh?=
 =?utf-8?B?RG1uRUlsMTdiMTVLcW10ZU1WaW9EVkkvbXVmWXljZXdURm1mZVdrckE2aEtv?=
 =?utf-8?B?Z3E0c1BpcjgrWjMyLzljaFp3ZXRYN2lTUHZuL3ZTc25MdHF1cUMvY3RRcTJT?=
 =?utf-8?B?N2o1RnZsclhDdStyeElYeHdkVFc4emtnWTFnbnA1N0VVbkR2WFhnYzBIL0d1?=
 =?utf-8?B?eHBrVm9tenJmRmM0VFhXQWZ0Sk1UYzlMcFpUclViYWFzaVZCSkt2cm5qcWU4?=
 =?utf-8?B?ZkVmaEpOQkg3YmpRanRTYm0zY2pPc1FwNmZYbVBUZksvczA5QnJFS2RkRWNH?=
 =?utf-8?B?ZWRtelZQSnFwNnA2NVE3VUEzd0ovQUVVNStoZjEzYTV5cWpYcXl6OElCQ0Nq?=
 =?utf-8?B?NGhUNHJiTnZSa2pCMEkwKy9pd2ZzU1dsaUVoUHQyK2tMVkV6Yjdzam5DajJk?=
 =?utf-8?B?bm90YWNpNXFTUWlFWkQ2RWNseDE1ZTBabkVROS9aNkdlSXhPY0tlRGkreUdv?=
 =?utf-8?B?ZFlJWFNhVmIxcXF4a2xiZnhyRVJmd3VUaEIvNzZjaEQyT1RsdnZsNy9ITEZF?=
 =?utf-8?B?LzF6MEVGZElsNGNYbXFrMXpMSTJUWGwrTWMzUkFtTHBqckdScTFuazI2cVE3?=
 =?utf-8?B?Sm90ZmNVOWROTTVFSjZjOE1BQ2FLRjZodE81UmIwZVhITjVYdStnelMxWFg0?=
 =?utf-8?B?bUlGR21ycjZnMUJobFJzeEo0MktMVmJOWW1RSW41bmNlQ2RqdEJFc0FQSUhT?=
 =?utf-8?B?bWMyeTAxa3hvbTZQSkRHYUdVbmgyTlBiU0dLa3ZyVFdtTnBLSXIrYm9aOHNV?=
 =?utf-8?B?MkRNbGt0WElJbjhONXNXQWNmUys5RVdlK2JrNjdXUU9FNmkweks5KzdpOG1D?=
 =?utf-8?B?d0d3ZWRVc2djMVpyV3NxcHRqSXptTXZkb0JraHZQT3ZUTlErMXNqQWYxTXpi?=
 =?utf-8?B?VU5sUGxCS1NhODdybmtnZ01yYWVUdEVYTHhrZmNJcGxEVlFGeFR4dDNPV0Jy?=
 =?utf-8?B?SGg2ay83cWhVRmxacmhMU0ZKUW15RGZaWmVQRnJuYitTSUg0ZzZxcHZjSFFV?=
 =?utf-8?B?NGRZWVRhbFZaTUl5R0pxL1lTYnZ2SEFuZTRnZGNNQXVpdU9mcG9sQWUzeDN2?=
 =?utf-8?B?bTBlMS84NXRFK2l1MjNNSGlYc0NmclIzR0VVQTlnSkZrRDliOS9aZFllTnZD?=
 =?utf-8?B?UVJmcmZqbitvQXpNbEhueEs0WE1lS1lJZllLTDJtSWgzUHBwb2o3aHdzTjRr?=
 =?utf-8?B?UDJVdXZPcEZCZVBEK2pLQ3RqalltOXk4dmdrVHFzekp1M1RhMVpldDRYb1RB?=
 =?utf-8?B?c0NncU1DUjFiYUpEbXF2NFdyb2gzWG5vR1RTdFFGUE1EMUMrMzNCQWYyM0xL?=
 =?utf-8?B?OTJIWkM4bWFSK2s4bkNUc1hRdVN4SG51UzdXa1cybUdkMGdnR0lCeWR5U0Vk?=
 =?utf-8?B?NjVHL2o5SENIWlp0angwOXFCK1hTeTIrOEdja1hMdUpZN2ljcTduUFJzaXFp?=
 =?utf-8?B?VmVFaTV5UzN2Y3hIZm9LVU1BSkM4NVR1WmJFaDNPUUI2RlVzcEdhcFROSE9X?=
 =?utf-8?B?VDVWdmVIQWVTMXNiL1o4aTlUWmwzRm02dFJJTTE0bW9sQ0d0Z0ZJYmJpQnVy?=
 =?utf-8?B?RzZhZUpsaHN2dktaRzZISVg1M2pDNThNdHRzQjNlcXBMUUh6SDhZcXl1Vm1t?=
 =?utf-8?B?bzdJTkl5SjNhZE9JTlFOckUvSU53LzZlV3E4dXIrZVd2N0NLME9IWFFqMi9L?=
 =?utf-8?B?S0dORVlUOWFXaDZyUFUxcUNHT2pHSTN6QzNkSzRJaVZGUWtsWkYxMkhsMFdo?=
 =?utf-8?B?T2E4ZzlOejZyeEY0eVZvV2IrdjNJekhKVEpoTXJ3a3JkUmpPZFRrNXRid1Q5?=
 =?utf-8?B?L2xqWkw4MzdJSXh3NEUyZW9hMElYTmd3b0cxTzZtZ3NYaFhucXhxN0ZMZllF?=
 =?utf-8?Q?hihABHg7+pBKaExx9hH1SByC+J0Eftw1FjywbzTyrR/Q7?=
X-MS-Exchange-AntiSpam-MessageData-1: T2y/lpMcQEgqGz4t6AZ2fCGl1nmaqRKJm28=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 687a61a6-55d2-4c3e-aed5-08da269481b6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:20:50.0990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 md0Ew7aY5RSFJ7dSyhN60h0ACgokOETPxQZovLHeenk497Voobz2FK+ZT7sbFv+RuVJ81FpDPrFS8yL2WR2R71zcU6IaCWlo15cH0DZve61B1IxhuMWEUaeeqggnJbWR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3492
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Apr 2022 19:26:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2857

Hi Tim,

On 4/24/22 03:38, Tim Orling wrote:
> Historically, new requirements have just been added to the end of the lists
> in:
> https://urldefense.proofpoint.com/v2/url?u=http-3A__docs.yoctoproject.org_ref-2Dmanual_system-2Drequirements.html-23required-2Dpackages-2Dfor-2Dthe-2Dbuild-2Dhost&d=DwIBaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=9mRC9z3X7F25ILlbLtjn7otitLoUMh_E1qNPdTXU1TQPlq56xwELjybPnCgrwfWN&s=dCV-_Bxq3xyGMWvW3XVbn6NGrNZDEkLdIjP83KMHyuE&e=
> 
> This makes it tricky to see if you have the correct packages installed,
> e.g. in a Docker container.
> 
> Thoughts?
> 

Nothing against it.

I'd personally list one package per line in the poky.yaml.in file and 
add a comment that it needs to be alphabetically sorted otherwise we'll 
forget and it won't stay maintained/sorted for long.

Would you mind sending a patch for currently maintained releases?

Thanks,
Quentin

