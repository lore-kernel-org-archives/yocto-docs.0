Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D70ECA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 08:50:14 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.16])
 by mx.groups.io with SMTP id smtpd.web10.11672.1757667005675834569
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 01:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=M9bZzPQt;
 spf=pass (domain: cherry.de, ip: 40.107.159.16, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/VRLsDKDuk4dyCP6JkUTJST/oge59LnRtlEf3yue2wA1fTkyBSoR6GFgYME68XUd/oDd6Csw1+OBEOH4El4EFv7h0xNz38ggzw9llvbbzzigbRopxxf8e35CzLslGDxfw/5Zif3QGttFR6D/9igCIclVx5oZXy6a2mvUMlCyJ1wnfybw2s6s4z43kxHyVrYopd3cLo20x5QemkmA5LPP0GxbjEY6aMvUxLVAhus9waImcYbDh3VnmpWutud7ANWWNgf1Cd2lG7SXRUS3/YaZy5tJDOSX7fDeNIZ1oMhmUAnk9hJcERdr7ZepAx9W8VJ2JKifNddnxyuwgyCoLlD6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ainnf8nSM3+THEajNiZhuBIjbfoRzriZIStLOSRtZZc=;
 b=I1t66UgDh9JI/Qd/8ZFCTqcnFUOlNrF2x4NxtgQRlMpxExwANdDKVXWO5+NcjoxQxHlwVjEeRgL44vZsWXlLsAE1R2TTtrxILK9fiPR67w94FOmUEo/FBb2GlWcUXywyID3pKOLk+a1/HONsiej7OxULpdPy9N9IlwvvE6UYwyhsH0PZ/DglFrQKzWF5DGKu/QwH1mBH+mj9KuwPYv42z0Ma6pJBm8a0BUp/iMC8HvsSSd7yRJWxcU2FPa18hpU2Pq2Wp7wqZmOrf4BDE18IquobSSxd9KD6gA+QPpXUf7wYkSqokxiMI5O+pICRnLbh6KQiqxE/fUOBKY0SOO745A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ainnf8nSM3+THEajNiZhuBIjbfoRzriZIStLOSRtZZc=;
 b=M9bZzPQtKcy6/hSbMjstmzhp+IXcYWZAdkN9rsYpMJYwHhBW0PMDcbMUP0uHj0xDQ18Gu19PuA6whYhZgRGChm4FasgA5zjyX5C1cKLDEFJHjO0qsRz8ueAm/0nkII12EZH8hacJEWh7lydu2kU1BkmHeMA6bnR2KMB+VD1mybY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by AM0PR04MB6881.eurprd04.prod.outlook.com (2603:10a6:208:18b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.18; Fri, 12 Sep
 2025 08:49:55 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%6]) with mapi id 15.20.9115.017; Fri, 12 Sep 2025
 08:49:54 +0000
Message-ID: <1d717a59-c9c8-4232-8d0b-04057f6ca25b@cherry.de>
Date: Fri, 12 Sep 2025 10:49:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] what packages/python modules do i need to build docs?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <8c6111e2-44ee-e1c8-2d36-e0958d7701c6@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <8c6111e2-44ee-e1c8-2d36-e0958d7701c6@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0270.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::16) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|AM0PR04MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f0cf81f-4edb-4ac3-f955-08ddf1d95819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?anZrZk5oVWNSTlE5Qk5JajQ0eFdKRElBd2hUa0lqNklFcWZkcEFkajdSRFB4?=
 =?utf-8?B?bDByZEVONGRzVE9nVEdEMk9zQkNyUGZkRzRSMW5NYU5ac3NnV1MwTXNCSXVw?=
 =?utf-8?B?cklmWWxwVk5ObDlGa3ViZ0JFMUNiZWFxOFBaRzFldFBURllYOVRIS0JhUFV1?=
 =?utf-8?B?UjY4TGdmWTdWb2Q0OW10ZWNFVjVLTGVDWDduSEMySUxnOFMvSERXb2Y1bE80?=
 =?utf-8?B?L2txR0lWUXJPTGlVMU5wT1lHWHQwb01XenhKODFzdTlJZHdNTXBnanRXdlRp?=
 =?utf-8?B?NVBKZ0lITnl3TENkak9yWWZxV2RPSTQ4RDZvNVkwRG1qNGN4d21yR0VxcDhC?=
 =?utf-8?B?NWtTQUg2OHJiMm00MmhhZm9Nam9IbkhXUTBqMkRJWm1HSnBLR1JFY0JPL2lE?=
 =?utf-8?B?TElCNUxXbUVKeFE1ZmZSTldJR000VzVrVXBGY05GSWExOWZwRlF5SjkyN0pH?=
 =?utf-8?B?dy8veFpTU1MwVCtLWHNTaHJEblBxT2pZN0xHV3pSS1hzOWxBUjdqRXNySHAw?=
 =?utf-8?B?WnllV0l6UjBKRjhZRk90aG5zZVd0UG9pTHh3ZitHV1NEbjdncXRIY0h0SGpj?=
 =?utf-8?B?WHY3a25jS0hndGtKbE5hODlvUWtCbldKcXJyYndKemp3eHVmb3h4R2VYYzdQ?=
 =?utf-8?B?NDQwNEt6R0swQWRCU01pZWRKTEdONkhPNFZpT2dmNHdmTlpVcmFLOUlXb0pt?=
 =?utf-8?B?L2drM3gyUmdHMXU3R3lVR29CN1BnQjBIaHltZ3lrTEIxK21EN0NuTEFhdDBq?=
 =?utf-8?B?NFEyQ2w0SitpSzZMS1g0dHpTWis4STZLYXE5c1dxZDc5a2xueFpVemZMU04w?=
 =?utf-8?B?Y21mQVlUanNSTnJQcEd2UWlYK3E5QzJCZTNVczZHK0dXY0FtZkMxR001WmM3?=
 =?utf-8?B?RW5MRkVmU1ZqSE1qVHk4WU5SOFBwSVlzTmdZd0VHQ3BsMEc5L2gvTSs3ZlJ5?=
 =?utf-8?B?UDRiZTlPMXgrTmNCL3pqcGN5Sm1BYTkvRXQ0WE9oYS90K3VHaEhjM3hyQ2VL?=
 =?utf-8?B?QWxLRTVNQ21NLzhTOU1aTkNLTmM5SUhRdVZOMThDQVRDTkhCaTh3cVRhNXlp?=
 =?utf-8?B?eVEwUWkxVm1aZjNBYUNBazROOHdpcXl2NnFOWHpucm1GdWJiVTY0U2k1VlBi?=
 =?utf-8?B?STFmQzFlZXYwS3F5aHRpL0NPb2Q4VkpRajFCTVpRaENVWDJzVE5XbzRXLzc2?=
 =?utf-8?B?MWgxaDkvakFaTFZEWEVvYmZQQVp0VHlLZmtvNXMzckNjQ05NNmhMU2xlM1Jw?=
 =?utf-8?B?b3FnZ1lwamdxTngvVVZjTnpyT1lrSFVyaGdBRVRSaDA3MGRmRVdzaTUrTmsx?=
 =?utf-8?B?NUM0Z3dzK1lFemJmcTQwb01MbmovZWVndWtObDlQdTc3SGtJZUN0d0ZnNlBI?=
 =?utf-8?B?cFBybkdEb1cvcnMzWnM2UUVhZ1BPSUpaaFFjeFZOZ1hIOVdrTFArcjIvd1R6?=
 =?utf-8?B?Y1VPK29BakJnV2JEb3dKMDI0YlZVZ1lnTDUvaDNBMldOY1ZGVzh3OGJ2UFpR?=
 =?utf-8?B?RnFZNS92ZlAxN1FyM3BXU0U3ZSt0NWhQNWpHeFBjSXVxSmNjWGxVTm0yT3px?=
 =?utf-8?B?cWNHVXNZd3djY1RQblhpVmc0akd2UHdHckNmZ2F1VHNnY0FTbTVFaG5McUVZ?=
 =?utf-8?B?Si85WUNQQWV2MHpyNmlNZ1c5VGpCb3NLSU11dEpqdy9ROXlYYnJvTDl4Q1ZG?=
 =?utf-8?B?SE5EL1JMWEI0VnhzOFNiamgyWG9BUU0vbTcreVNtaDZkRjdZN0M4WW9ZS3F3?=
 =?utf-8?B?OXdUQldxYVlISnFsY2VweDB0UkoyaTVrcW9pdWJNUFRGT3pXRlZzYjNxUlIw?=
 =?utf-8?Q?vV9FwFz2PCgfjJsetvrh0NKU1qbt1FTbJZlgU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cVdGa1pWeEI2UVUvYmt1WDBBMkZtcWlEcnZFMTgyMDFZY3BzUjExaFl2bE4r?=
 =?utf-8?B?cWdBMWxBekRJNjJuenEwSjNvUk1ZMnIveVlpTXk0cXdWcDlaRHpsZDc0QWND?=
 =?utf-8?B?VVNvbG9YVVFVdHdEUHpkOHhwSkUwcXB4V0Q3bkdJS2lHL2JjZmNQbXRhZ3Ra?=
 =?utf-8?B?aUFQNWlXTlpHWG9sYXh1NkVUcERobTl0ZlEwWnlzNXJqby9vTVpqM1FkVEtV?=
 =?utf-8?B?YjNEWVVyNU50RWoxeHBzK3FiK3Nobnd2WFpnR2JDY1pUcEVISkRlR0Y2VjBj?=
 =?utf-8?B?UTRxZjlzOFFzWU1iNGpKUHk1NDFrcDNtWkxHWnRmZWVucW1GMnJKRTlTK1Az?=
 =?utf-8?B?bzRVU1lPenM4N1RiOFhIV0xmRFRmUUowL1ZwUFlWc3h0M0x0UU1SZjFEM0k5?=
 =?utf-8?B?am5UTmhOVTA4NXpsaU9HelkyRnJ2dlF6YWFRaXFXNW5jN0p2MytmK1lJdW1O?=
 =?utf-8?B?ditxOXFhWVZRa09VMmxrUjU0RkhaUVB4WlR0NnN4eFU2My8wbklyNWRpZFly?=
 =?utf-8?B?US9LaDY0R29sYyt3bktnRlhPUmF0NnUvSXhtMUgzckk5MW1wNld3WlR4MkM0?=
 =?utf-8?B?bSsvYVRwbnJmMTRiTngwblNoRlNYeWhSN1dieDRFY2RrWXdXY2VRM1JrR09E?=
 =?utf-8?B?UHRwYmRDMndTamdJSjlLTEZTSis0RldMZnJXc1dtWWVCeXVuZVZBTmUvMFU1?=
 =?utf-8?B?T09NUnVQWXgvRGFLalozMnN3TjJJVTllcEthMHV2MzRLWkZNcVl5ZUVtbURk?=
 =?utf-8?B?MVR3S1RYOVM3Sjhmait1WXBYWnB0SWtiUkFOMS85QlVoWEdHVi8xTlh1RGpO?=
 =?utf-8?B?L09meGFVd1ptZVU1UUtIU0UwK0h5WVpVWHJzS1RobGlPSUJYS2dUakdPSjBw?=
 =?utf-8?B?dks2TC8rQlF5UHZNNlNCUFFJL0FzSlpCOFBFbkdPcHVTb2Yyemp6UFdVc1p6?=
 =?utf-8?B?SWpzUmJSbE9FZ1N3bjY0enJXZmFVSDVsdlkxemJsUDhqdVAwZndkWHpkMHgr?=
 =?utf-8?B?bHFxV1pSdTlXOExLL0YvZXBFNG9GdTQ3a1dzOXVYdllKZFN3eFNPbGVweTI2?=
 =?utf-8?B?TVVSM3RHNnNSeDNwSm05K1BTNTRYS0gza3lTbkhtZ3RwamxVWUE4eFVGM2hu?=
 =?utf-8?B?VHFhRHhRS05URGJ1d1RFTGsvMzNxcjAxSWdEaTZ0Qk10N2drREN2VS9IbkZk?=
 =?utf-8?B?VktPL3JoK3BteGJhNXJ1Y2cyU1JOZmVFcFYvUTVzV0ZNU1R6dHdSbmVMTkNR?=
 =?utf-8?B?UjhUdy9GckQ3M0RuQlN2K01iMEZ4d0Q3OTg4S2k0eThtdmNMQXlTQUlBWkFS?=
 =?utf-8?B?VXV6SHNtbTI0bFE0aEk5V09TSXVtYnVWZExuUlY5eXhMSmdBTmFldUlGQTJ1?=
 =?utf-8?B?Qm5UcGt5RlZMYmVialUwajEvcXhLT1p2RE5EbjNaUDF4Y2RHcE5jVGw4WU9S?=
 =?utf-8?B?RzV0eTZzNEJCY1dyaEs3U1BKb3Y2ekVHbFJFOGtQYWsxV0pNOTdCRXhDN2cw?=
 =?utf-8?B?QTI1VnVJM2ZXeVZnU1kwTGdvTVlLbUt6S3YvQkRYRHEvL2Y0MVYrQkNqTVQw?=
 =?utf-8?B?eE5VUEJPRlYxNVpnSy94a0RqWHpJcE9VdXdRcDd4NkVBaHQ4S3I0Wk1QTGt2?=
 =?utf-8?B?RmtCM2N0a09SSStCRkNGTVI2NTNzbkxWek53Qms2VGtHYkNYME05ZFd2WkFT?=
 =?utf-8?B?ZStyOHIxOXZVZWJRMjJrNSs2bE1YVW1BNzJKRjVvWlZvVmNFVEtrK201ZDdC?=
 =?utf-8?B?OWFadU5uT2dicjE1OU1IcGwvZHFjK0MwMVh1R0VuRWhiVStPTVg4WHNEUENx?=
 =?utf-8?B?cW9CVTVqWjYyN09mQm10Y01iMUZBaVVySmc1RmJoejZtbzBRYWQ3QjArYnlH?=
 =?utf-8?B?T0FucGFoOEZPNHJOT2IxaytFTStRR2RKcHc1ZWhHdUw0T0Z2STJTR2pZeVBG?=
 =?utf-8?B?ejFOSTBhaE5FZlFOWHdzYmdja3Z4WjlTQ3p5OGVQRzNyQVljUmp0YUpqSitE?=
 =?utf-8?B?SUJQSU9md2M4TDdtWGY0OFFFVVhhV1JUQWlzbjNXQVRrZ1RkVUdrK25WQlZj?=
 =?utf-8?B?aXZtY0RiUDNsR0FwTEpUYVh5MjNqdDNJZzc3Rjh2NWVlZC9EOXhzdnUvamFR?=
 =?utf-8?Q?s/Pgr4oWGaf8g8s715ALRmg4x?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0cf81f-4edb-4ac3-f955-08ddf1d95819
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 08:49:54.8995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ha268ZrhifYEPWFrcbOfqEyUk67dJwL6ZIVxOR93gGwkG5s0ca6FmuuqlPKKdbwR8sgzUZHY7x1vw4tVd6TP4CgbH7k9s7ECiseobUp7wUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6881
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Sep 2025 08:50:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7499

Hi Robert,

On 9/12/25 2:41 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    (not as dumb a question as you might think.)
> 
> i'm moving from ubuntu to debian trixie 13, and i'm documenting how to
> build a dev system for some colleagues, and i want to make sure they
> (and i) can "make html" at a bare minimum, so i'm looking at my
> current ubuntu 25.04 setup to see what i installed to be able to build
> yocto docs, and i see that i have both some sphinx-related packages
> *and* ppi3 modules installed, and i'm wondering what is the actual
> minimum i need to build the docs.
> 
>    what is the recommended S/W to install in debian 13 for this? i
> prefer to keep things minimal.
> 

https://docs.yoctoproject.org/ref-manual/system-requirements.html#ubuntu-and-debian

Also know that we're building the docs within containers, c.f. 
documentation/tools/build-docs-container Considering we do not support 
Trixie right now, you'll need to tweak the build-docs-container script 
to allow you to do it. But essentially, it should work with that so the 
dependencies listed above (though maybe the PDF dependencies addition 
may bring other packages we depend on that are required for the normal 
build and we "forgot" to add them to the original list.

In any case, please report if it doesn't work :)

Cheers,
Quentin

