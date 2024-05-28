Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43A4C25B7C
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 14:06:42 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.114])
 by mx.groups.io with SMTP id smtpd.web11.23171.1716905192905763023
 for <docs@lists.yoctoproject.org>;
 Tue, 28 May 2024 07:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=GSQAqQgu;
 spf=pass (domain: cherry.de, ip: 40.107.8.114, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZCO3R6u1palxdhTqj/WmjFYBVen+DUyZ1Q6Pb/r38ZPkGW0StsUZ1m06NYgCrezGRg7+87KTM4pd+Ig8bH4Ez7z2FgmRlkfD56ndsU7iMJBKOoXduAq5I9Q2VH/L0U3CcTQXOd8C8DddUEupDKhWleBK37vs9/uP3bqmygLLMnT0/GBNboBcWP6+uR+jjIansCc71aiO888gYJUu0355BRMjr9dnI9u0QUCVJeMQkolSPV9K7TlNxDGmEWOQQNFcuqr7QcEtef+O1bkhP8lwysuxb85IuKkB2ikg+Hx4tvlZApFxcDfUy4GdzAx+A64Oxq08/iGmdCGwuY4uhfB1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hr/r9KHD3wUb0fhiwrfbilGZu46fUNwOveP+TQgZ4k=;
 b=iKwGxwlz1kFolNdeTlO9bBHsg5e4zDKIqdatmrLVgMODJ7x/lsYsFf/F+cZIJYNFD0vZmxfwn+CNNVot8s/eZrTh/eJ38YhHf4URAz+d7QUWXjkYhvBNJzo2kWTYvboenMuG3U/GgbgrZN71nWM6V+NJKqvI2XPWXOAoWZS0ywQbIGab5DD9wTXcrmcX2Lb70Q92ebMZ7ytnpw6LjmrfvMTq5fNcGYNi1ddFcATY/T+LiRYhTYGb0k2JukbIPLQ4H9XsSj2edbxB0LuAYlUUYu4DyzVS6cqiJa/p5QJL6Ye7LQ1lovl4h+VH0CSfBOnzWiF2hbWY/BHyJveB/6GXwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hr/r9KHD3wUb0fhiwrfbilGZu46fUNwOveP+TQgZ4k=;
 b=GSQAqQguUeuYFknbsvBz9zL2tOZTemiIhEPDu54Ei08WNQVR+SJxkPD8d9ilbtVPaHBbZlDzqiW/35tnJuNA5qX4EXVmqSyOWb7QVWgHIBgyreBisPKNViiASdbHNEj3rrLvY/9u4ok31dcWjSf/WhcOOvz781KYPR5+ovKnPBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com (2603:10a6:803:128::25)
 by AS5PR04MB9970.eurprd04.prod.outlook.com (2603:10a6:20b:67e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 14:06:27 +0000
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31]) by VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31%6]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 14:06:26 +0000
Message-ID: <366bbadd-368a-4655-8e13-78b2e700b544@cherry.de>
Date: Tue, 28 May 2024 16:06:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] migration-5.1.rst: fix incorrect title, Styhead is
 not an LTS
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org, foss+yocto@0leil.net
References: <20240528-styhead-not-lts-v1-1-189c031e0152@cherry.de>
 <931907416827f90120882431b405350ca7f60fe3.camel@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <931907416827f90120882431b405350ca7f60fe3.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0038.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::8) To VE1PR04MB6589.eurprd04.prod.outlook.com
 (2603:10a6:803:128::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6589:EE_|AS5PR04MB9970:EE_
X-MS-Office365-Filtering-Correlation-Id: 02c1239b-a11e-4db5-8d6b-08dc7f1f5cf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Ty9RUWxkMWd2VHRQc29tOVRUOGhaVFBMdTIvVlJJVThsYTNmcFhVUk9wOFVE?=
 =?utf-8?B?KzMzUmpqNHluMXk3SEp1OGd0bFpCdWNGNlZHeUY1b2ZSRU1pd3A3Y1VzSnVJ?=
 =?utf-8?B?amxXSnh5bDdnK1pGaTUwRm05S0QzQ2xlajlnalJLbjRYWVozaElzeEZrb2lx?=
 =?utf-8?B?QnM5eGxDcUhMRURRN3lmTCtvKzZDTmp5SlJZOU5sc3RlZG5iU1dvSVdDYU15?=
 =?utf-8?B?eVBSeFJaYzBaQng3emlkbUlvckJMTThaMlNYZXJ5M0xFTkFNb0VBOHYwUS9t?=
 =?utf-8?B?ekJ3UXJkL3RuMVlKUERNR2g5M21vMW5jdGdZRVd6M2NObExlMHRENWlNRXo3?=
 =?utf-8?B?RmNyS1B1dlpRN2NNZ1NaY29DY0kvWWdEY0lVbTR3NXhaUFFCOVdNRGNjUzhU?=
 =?utf-8?B?UlZQMUM5L01DL0RITEhHSC93Z29nTW4xaVZEdTVxWVk2WXkwbnpHQnNnVDVa?=
 =?utf-8?B?dHAvLzdqUXRPUjRjVWQ3eDdIRUgwMWd2dlMvRUxicmtuU0doMlFWeDNESXZv?=
 =?utf-8?B?RGtnWDZKQy9ZTGJtQ0wvNHNtOC9JMjVVWEpISzk0L1Y5aklpOUI1Y2JEbU9w?=
 =?utf-8?B?amNTUnY4N2NDSlE2M3cyeHJmck93QzgxZmxrRFo0N2pFck43WERkZFQzM2pD?=
 =?utf-8?B?eXUzeS9wNDJBYTBBc0pMbzk5Q2JqTW8xdnZON3JQenRUeGo0UVhXYS9KMllP?=
 =?utf-8?B?TFQ4bHZNcWpKeFQrYk9lM1RFNFloaHA1TmdMWWZ6MmpreWVyOUozSUMwRXJ6?=
 =?utf-8?B?bER1cExrdldTVFhLV2RHMmJPaW5yaEZTdktJS20rL0VrUWZkeGdSZHVvQXpx?=
 =?utf-8?B?YkhhUUNFbThtcloyNjVxVEhMWUhCczdkS2liNUwwcmZ1QlZzNWZCVG1lcEFR?=
 =?utf-8?B?MW1BUHdiMG9URTZIUllyK1ZBM25JMnZSakZqRTljWnRRdWNualdrUEUwVjI0?=
 =?utf-8?B?MU9NcmFtS0NZTnBhaU9qL0NROFh0NmduSlJ5QXVqSFBtaFdVblhvNWk3dnE3?=
 =?utf-8?B?VGpGN0lMOHhsRXIwR0llTHhVSnBYeVV2aUtZTEtsR1pObEMxdTdDLys0SDVD?=
 =?utf-8?B?UjVCQTI4bitYdDA5K1ZrVmo5cXhZUmNEQkZ5eXlGR1RTZ0s1eHo4SGwwQWFa?=
 =?utf-8?B?UkdjZE9wRE9oVmtnL0IrWXVHU2JqdmpaMjVKL1pobFd1WlUrMlFNclU2K2My?=
 =?utf-8?B?d1ZUTksyLzJlMzkrTkxpdzlSVTJZQ0NxQ3F5bjMzTUNNN09NVW5kcFYzUnpy?=
 =?utf-8?B?Zm4rRlNkSVlsTnRqbFZQcnpycUxvZUpDejJta1pjak9YMGlYa0dUV2V6Rmpt?=
 =?utf-8?B?U1JXVGhHRzRKMGdtcXRVdlJsNFY1RTlkNmZmSlJvTjNEK2U2UmxQdGsxRmV1?=
 =?utf-8?B?bjZ5aVdxQXloNGFaQVA0K3I5a09yeUZMdEdkbmMvc3VTV0ZLTE9tSUdMamUx?=
 =?utf-8?B?L1BNTjZuQ3lhSnZoRVVpaDZLc3JMYjBRZFpsekRtc1hJaDlIdkMvUWJOdmor?=
 =?utf-8?B?WkFlMVdjNXA1aWdoM2h1MXZnUk94Si9GV1pGZzVFV3VHb1NuRnN6WGFocTB3?=
 =?utf-8?B?b2FEODAybEhHNlNRK3VaZy9UK0liL2NJa3JBVnRVTTc0dlQzWUo4K1RTYXNs?=
 =?utf-8?B?Wnk4djJheFhEKzJLWkdwMDVRTDBHTFo2NkZrWmlTbUZOejFwcDN6NnN6NW9u?=
 =?utf-8?B?SVpRcnZ5WDk4ZHVwdm5nVmo4ckNPQmNTaDgrbWViM3VuTXpOZGNENzdRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6589.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WUtsRlJTa2JpRjd6OHQ2cEc0b0ZVTEVweU56eFhvcVFpckh2ZjdGY2NIUWdZ?=
 =?utf-8?B?U0R3Vk1rU1RIdm5KSGFVSC9CdUc4UTA3QnBaVlVrNHZjNXA2L2JxbUE3N1Bn?=
 =?utf-8?B?QS8yYXhodjQwWEdmdzZlNWVhc0kwaTJiQUVvendSbTVlVEUybzZicEEraVZs?=
 =?utf-8?B?ekdDYXE1UUh5NXlaYW5rc1Qxa2lkeDdSN1NhV2JGZFhGellZaEx6cExMZFJn?=
 =?utf-8?B?MUI4TVFnYzEwaDhiY1ptRmFNM2w5RHowanN0ak9GbkFmMEZoS2xWZXRkbGhq?=
 =?utf-8?B?cHdmNHRYODFXK2xCaVl0QXVDUUR3OFYwNlMvVXVHUE54TXNTclRBR3E2dC9k?=
 =?utf-8?B?ZEg2NmUwV1hOTURUczVhQ3hTMDI2Mnl1SFoyenhreFFkL1JCR2ZkVisvRHB4?=
 =?utf-8?B?SjVMRlEycTA4QnlmNFcwc2hqUVc2SFNFdWZwZXdWWWV1b3ArM1FsS2YvOEQ5?=
 =?utf-8?B?WTYwWWFJTW5VNjJnTWc1NUdNMThWaW8rem1acUdWTFMwb1h0eDhERWdzU1No?=
 =?utf-8?B?SXRDblI1eFREZTFsTjdvdERFakVtTERpMmRvWVFTQnBYRkN6bjVka2c0R1I4?=
 =?utf-8?B?YU9pYjFSRklxMFY3LzNzRUd6SlJnUFFCdkdnR3UvczB4OU11V0VOK3dvNUNv?=
 =?utf-8?B?eFdzOWJoWTdRTHl5NEFURXhCOFZYWWFTRWl3bVpkNkVsT3lKVStrZmw5T2pp?=
 =?utf-8?B?eWdYSEJDUXQyNHYvSlNvaDJtQ0FueEZyVE1tcmJZbHVyRGg5Z0lOV0IzSlNj?=
 =?utf-8?B?VGFGQTZpd3JXZmRCTlNhbjJwN2pwRUIxSHU1ZGV4OHEyTzJVd3VKMWF5eTY1?=
 =?utf-8?B?TUVvbmVPU29jbzRTdXZMUjYyUnpGUHdyRFF0WFluODZJYVFHM1Q5bXZSUUZQ?=
 =?utf-8?B?aGtVN2dmVzJNUkNEMUE3S3VtYzFrRWZ1cWptKzFWZWd2U0NnZ3NRRVczMmxM?=
 =?utf-8?B?MG11dDBxMFhTZ0t0b1g2Z2RrNGtDc0dqb0dqdjdTcGRaMWxYcEVJUXo4dVhM?=
 =?utf-8?B?eE1hT1pKOWNSSU9PdUJVTGs3VHNTZkhwb3BLSjdUc203UWluMVlPSURmOVgy?=
 =?utf-8?B?d0Z6dzBNR1MvTkNqd210dSs5ZGhKcGUvWWhseHB4TUJQK1ZUdnp1K1VDVzZm?=
 =?utf-8?B?RGsycUEvVnJsVlAxbU8zb2JnQ2UyV3J1KzV6V0hURmFYbEtmcVRkSjFLbzhJ?=
 =?utf-8?B?SHFZS09ZUGJvUytjWDNlVzhBTWk1ZTJnc09oZTNSTzhGeGtBamFhbVdTTi9R?=
 =?utf-8?B?aTVpVmJxelZBMHpEWW1HYVBtT2pqSVNWUmZ0cXRtM0VPODl5cFU0ZlhsWnRK?=
 =?utf-8?B?bmVhUzBGRTltS1hQV3kreFoweXc4NGdZaVlkM2k5Q3ZvMnRCREZiNzEvNmkr?=
 =?utf-8?B?WW10dTk0VkxrQ1RiRkFBY0pWNXg2ejFNUldhb1Uvd1lPVnF5aEJlY0FFS0Fw?=
 =?utf-8?B?WDBvemlWa1dJQzMzVTgxV0tIbzRjbEJSaEJISEZhUk9pYm5wYi8xWEd0eHpQ?=
 =?utf-8?B?S3F5MXJhSjM1MWVkTVJhbVlEMUNPMGE0NTh6ak9TRVdRNEFGSEVEQmhyMmlV?=
 =?utf-8?B?ZkRzRFR6eEVQdmk0VDRISFE4Z0R3QzZaVmNMc21DQ3ZYS0szVkIyN2tpZzNV?=
 =?utf-8?B?Q2NLVk1TUnFGZHhnM3F3dVlXd0ZVQzN2bzVkdzFXUFF4YzJTVms0RmVyRy8y?=
 =?utf-8?B?M1h2Ry9uK1lEcnRUZzZFdS9LZE9hTnowWWRPWm1hRWRKMW9aSTRBSDd0RVI0?=
 =?utf-8?B?QUlMQUR2YmVHOU9nU1BZSzg4bG8yRm1nS2ExdTlYUHNJRjJHeVR3TmN3VC81?=
 =?utf-8?B?c0g4VEs4UjdwQUFsQ1h2L1RTQUFjc3FGbm05Rzd0MFFSaXZTWXZXaUd3T1Va?=
 =?utf-8?B?bEFNbHl3RHJLbmlqaStTR3dFR29GRzBhYlpnT2JLZlE0KzAzd2ZvWm9SSmo2?=
 =?utf-8?B?Zzh6Njh1UlZScHc0bnhtRFp0Q3pnYjNQT1hlUU43ZWJkYmFXUG1MSU1yQk9P?=
 =?utf-8?B?SCtWZENoK1plcnlMcEUwd3lzZy9HMkg5a0N6bTlaSkM1MlpzbGdGQjVNaHUw?=
 =?utf-8?B?T2h2S3R0bklrNGp0bllxZWV6UmV2RW5Iam1BdUw2ZXFBckdHTUpyVFZ4VTZV?=
 =?utf-8?B?OE5heWJ0M1N5OHpjRWN6TnFoLzg1aTBiZ3RoQWNwNmhDZUJabmo4OTJkbXJW?=
 =?utf-8?B?NWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c1239b-a11e-4db5-8d6b-08dc7f1f5cf0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6589.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 14:06:26.1280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vHudQi4IKlxcWgtxpccPbFyScI2B7E8+6hsA8jERJ3S/aESIKOVxbypAAsL/lnGlcPLvjuhywy+SQCMgk7RabibFyC0u7X4HdzNsGJZjiS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9970
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 May 2024 14:06:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5258

Hi Richard,

On 5/28/24 4:01 PM, Richard Purdie wrote:
> On Tue, 2024-05-28 at 15:57 +0200, Quentin Schulz via
> lists.yoctoproject.org wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> Or at the very least it wasn't publicly announced.
> 
> It definitely isn't!
> 

Thanks for the confirmation, would you rather I send a v2 to remove this 
from the commit log as it could be interpreted as "we haven't announced 
it yet"?

Cheers,
Quentin

