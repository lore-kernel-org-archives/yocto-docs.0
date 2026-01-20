Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF090CA5FB2
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 16:46:57 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10860.1768927612192439394
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 08:46:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ZPQ5B6lu;
 spf=pass (domain: cherry.de, ip: 52.101.66.27, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=luRwTtOIkWW/YRwQg7EvxewtzuWCNVXex+uvDDSA+QOGZ7Mc/dMUfp70Pe23eDaaPINBQgfdbDIyaR61GVD/4tjJBwH2Uxi7tFM6FTj0A2gHpNEh1x4KDn83H1yITb56FaYQ6sSYT3hDtF7dnpIUlXSKdZCY5dzB9ISGTBf1iJXW99598prkNggeHip9IPT766k6wV8nz+4MtNAPEFRY/lr46dhZbSXsT6P0jiiGp3TD3B42mVX8jr6RUA9E6JWnD6EH1Y4HiuppCNDickk5JKBAZTXerZeAG6vE5CFzGqfdUG9aX6JksfN2V3/EQcorElwEGNYFU+eN8e+5njgZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPCRTAzAji6CSs+sfVo/IrTis3piIgynD2mK5pQpsQM=;
 b=A+4lFBQ6gyrEhLSqYMJ3fZwOG+41D5pX8si92gvfXb4ePQXgttCNIzbjfK6NsL4MQ6LcAMrnKZH2OG9k+3BriCGaBvl03TeVMJWkurkXzK+w8bCTo6Wnh5YB6kI0sfpilri33oa0DYXtuHiecfvSUnDXzu9HJN9mpf0kdyFHt46gxXye0sOhtM6SzsZzwnmeCRpTcpzaEbDGG3k6RhLzfcvuHLiaQOELbaw/2P61uA/OiFK90nKXO0E2jb9IHXxrEk5Nl15XbLruRqPR6bPJglllf30ygWd0pCclYvFmWRRzQ4zwrg5HVuvhPtJQdurrC9kLZ0m+gW3+PYUXBLQ95w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPCRTAzAji6CSs+sfVo/IrTis3piIgynD2mK5pQpsQM=;
 b=ZPQ5B6ludVqA83U+6xKMB8RHxyYpdzbUCWKBDsxaCqxNKSlMiGr3q1eDUBQ6NRrsouUegs1qs+1p3bO0ezvBshGQS9vvNQ5noDycL+R8HlgHbVpR+EEVM2YFw84tRr7yNVDQcC/VIieVUfO+118vj0ZiZeunA4TWVrDgU85zOFw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB8152.eurprd04.prod.outlook.com (2603:10a6:20b:3fb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Tue, 20 Jan
 2026 16:46:47 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:46:47 +0000
Message-ID: <8b265fba-6ac2-406b-9845-0b2b3bdfb465@cherry.de>
Date: Tue, 20 Jan 2026 17:46:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 5/5] ref-manual/terms.rst: refresh the
 OpenEmbedded build system definition
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260120-terms-refresh-v2-0-fa49d15b209f@bootlin.com>
 <20260120-terms-refresh-v2-5-fa49d15b209f@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260120-terms-refresh-v2-5-fa49d15b209f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0098.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::27) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: 55e9cb34-2860-4df0-6c08-08de5843806d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YjU4L2pCWnFXMmp2Zjd4ZVBaOUdwTTRkRVRHejU3Ulc2YmNOK2hBUm9FblNa?=
 =?utf-8?B?b3ZueUx6TkY2cGo4blE5NlRwcWlSTW5aRWo0eVBiSnNPQlVwYXhhVGNGaXJr?=
 =?utf-8?B?SFIwRUVIZ0xrcStoSTR6UEdvZGFDSXFLUUJualV4L1dDRWhRTjFKb2txdWFN?=
 =?utf-8?B?azBZV3lOZEVRYUw3aTA4RWFBSnpiMXNjT1VoLzkrNVVBa2dLblZaN3pBc2FZ?=
 =?utf-8?B?bHIwWXhjN2ptVmxJd25KYlBYNU5FV0dBb0hxbzZSMFV0S3YzY3VZUytwR2Z1?=
 =?utf-8?B?NFVzdjVLVFArMk02SGxGMFJOemFiMTRxOWFsR0twRnAzYVBFUXZ0U0RXYXpG?=
 =?utf-8?B?bzA1MG9yZnBKNGhaMFk4MWg4YjBsUkRYdThlWFI4clVkazJLMmw2ZHliUWpy?=
 =?utf-8?B?Z2MvcTgxU0llVkVCcVlIMzVuSm1lR29WL3l1SmxGU09ORVpWc2lYOFZzMWtJ?=
 =?utf-8?B?K0hQQm03amJrcVllT014dXBTa2JzSURVY3gvN0I4YjNkUnROenp1bmZ6YnVN?=
 =?utf-8?B?czFiRlZUUGh5WGN5b2VEKzBTZEsrQjRxL1J4RDhpYk5VVDJKeFJWWWF5dkJ2?=
 =?utf-8?B?SXJkUVNTSmZTT0NKQ1p4TFd1Zmw3WEttWm82ZzM4RDBYQW84MzZXbkQ1Tm9u?=
 =?utf-8?B?WXJCM2d4dzd2a0U0WE5kbkxNNHZDK2QwSmtaZjRzeDdmeTM2QStXL1ZCM29r?=
 =?utf-8?B?alVaaDN5Y2xrU3hTRGdSd25CdlVuK0Z6bkhNNkZxQlE2c1FUMy9vQ3dqZ01p?=
 =?utf-8?B?eEFYZnhka3V1N053K3RuOWxRSEdIcVFCQ0RhQUtTck5wMXZsZXNXUkdQUEJI?=
 =?utf-8?B?RS84TnJRT00yQU40MUhldG5Ba0pXelAwLysvaUUwVi9lVVpZRkhBZlF1bE1Q?=
 =?utf-8?B?R01BSGR6RXZUTVVnb1pPNk5IU3BhYit3amRzRnVPaU14TTdHNWIvNlcrQXkr?=
 =?utf-8?B?ZDBjNjErb1BLUS9NTHhuU1Awd2JCVEFKS2ZUM1F2VGtvdGNpTHg3dHJ6cjYx?=
 =?utf-8?B?bzlaUHI4WjdrUk4xamQ0NForNEJmU25YOGs3dDFmOUVrcEd1VDBVTjBHdjIy?=
 =?utf-8?B?T1dYaGxsQUlSV2JxKzE2bUcxQ01TRnJMVkNkbjJDTUkwTFdMdXpUaVUySklh?=
 =?utf-8?B?eFB0T2lEL3R3b05LRUpCZkRuUGJ0Q0w0OXkzOUhOVjdZWjEySWdkazZrc1R4?=
 =?utf-8?B?TkZCeVF2bnRzTUJGMGs5aGZjOUw3MVhXNi8yY1BZQWJDRThCN0tZWnFrM1V1?=
 =?utf-8?B?Z3BBUEpSTkxnTzVCTU5oRTQ3T1pWQ0g0Zmp2bnBucVBuR2krRVgycmxTZ2Z3?=
 =?utf-8?B?UndWV3pIM0hGVWo0LzdJWXFvRXAxalVDL2RXbWUwaE56eWgwSThBZ0cvdTUz?=
 =?utf-8?B?RDZ6Wko2NU5iNy9LcU9IYU8rekpYT05oRXcrWVU0b1RLUVdodFVGejZtWTVV?=
 =?utf-8?B?UW5la1YyK0VvaUtDdmFIeitvSk1IOC9uelFiV1JFdnJDZlVPTWduald6Y1p6?=
 =?utf-8?B?QnNnNVYvQTVDL3BCSm8wNDZKKys1VFVBT2dEM0twVGtjZzgzd2lWdmVvaG1F?=
 =?utf-8?B?d083dmc3ak5ubDZOTW8wQUliTEZDV2JwWmZOVGdkVEFlUUtlNzJzY0dLVnNL?=
 =?utf-8?B?Zmsza1hraHR1SWM0YVhKODJKWjF0V2dOVlFSMU1lMFVsWWgwYk1sMDZEVVJJ?=
 =?utf-8?B?MGFVa1laTTl3NVlKaWl4eklxMkpKMDQybzNCci9qWVh3d1FzK2Q3dTJuS3l4?=
 =?utf-8?B?N04vaWdUemJ2eFJGRTFyNDNqd1VzdjMxTCtBZkxpRWdqSmorbHNnUHhCVk43?=
 =?utf-8?B?NitYVFE5TjNkWHZEVnBCbXcrdGMxSU1reDVadTUvNnFadHhyU2N5OHppSDRR?=
 =?utf-8?B?cjNpUGtHTGtVdnV5RGM5WmE2STBvN0ZoblRzS29GbTl2c2cvSEhqWlZmcUFk?=
 =?utf-8?B?VXZHSzVod0JGaytBZEhCSHdzQ3FJZUl3NFYxWDMrZmhpcDMybmtNQmRkU21K?=
 =?utf-8?B?cVRTVlR5NEo1cGd5NWhHemdnM2luQ3BUbksrL1lIZHJnaGY2OGlDbWttWlZY?=
 =?utf-8?B?VDNSU29wZ1VaRzZxYkNJT1lhT3paa0hEeHAxZVdiU0ZQNEJSbi8yWk1sU1hW?=
 =?utf-8?Q?HORo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S1NsQ2FNV2QwUUZrNEZtOUNDNXU4R2ZaekJhaFdrMzlYMENtcVI2VXA1a1ZG?=
 =?utf-8?B?S1BCcjBsVEhYVVhveDQvZ05oSTN2MnBhbVA5YzFONXFLVnorWkdaUFRXNys2?=
 =?utf-8?B?NUVBMEt5MDNlLzZsN0EyTStUU0ErQklFZi83MzFqRG1KWWVnZERNa2k1YVpl?=
 =?utf-8?B?Y2d6dEZOdjVPakt1UGJBQ2xVU1M4WmhEUXhCWFBMTm9ybVpUT3pWSTNsSjZm?=
 =?utf-8?B?aDlnazQ3YnlZdENHL0NEeXpHTGZ4RGFCRlVDVzArZUtEbkRjVmUvcElnOUNI?=
 =?utf-8?B?K0hYc2cvM3ZaSDIrVXJ3b3UrTlBpaG4vVGhZL1M2WGlVZFFJQnY1aTkvL0pw?=
 =?utf-8?B?WkZmOHJ3UlI2ek4zcEVya3ZHSmoxeWNnYXFTRTR4bTAvUFFvbTBkQzlXU05Y?=
 =?utf-8?B?SW02UUduNkpRajl2elZwd0xZQXdSK0dUS0EvRzhtNERVMFJYUEVJY3lTdnZn?=
 =?utf-8?B?TWxqTEcwbjc3TnBBTHBxdFRFUWxhRUVvSFY0SEc5SXZJMEJoOHY5T0NYcnNq?=
 =?utf-8?B?YWQyYXo3OEZzaFBLUlRTSHlZZTMvd0RYdFJOTldjeU8wZFRhZFR1OWVKazVW?=
 =?utf-8?B?TG5oZWo0OVI4akNOQzhoWTREd1pSb3Y4cVViNWdQb0VHVCtPT1FlaWZwUDQ1?=
 =?utf-8?B?eDdnRGVYck5oUnNTZUFZZkhndW8rakZLbEx2MGpuRFZHQllQOENRTHdobEVE?=
 =?utf-8?B?emEvL2JKbGxGallnaTM5NUo0RjFMS0VzenZTQ0lpUDJ4WFhETjR1ekNEWnkx?=
 =?utf-8?B?UkxFbU4zbEw2NVQzR0grZkRYc3FOZnpPMG9vdVkrbXNDaDFISFlDQlFid3l0?=
 =?utf-8?B?TW04UEExRFpXd2pGb0ZwaUZock9TL2QwUFViV1V3NUV2WEdZU0NwaTVTcTRD?=
 =?utf-8?B?RzZqekVjUDZNRmlnYWRYdm1xZ2sxSWpQbTVPRzBSbExJUE9DTUdEV2xUeXRC?=
 =?utf-8?B?TDEvL3dZOGRMSldJbWtwOHhraVEwRjhZMm1OVlVPMXBuQlVKWjkvNXJrcUh2?=
 =?utf-8?B?YUNqaVhSTXpvWkl2Vm1sQTV6dHVoSDhwQ0dNTWhqQ0VObFZBRUNsNkNCM0p4?=
 =?utf-8?B?cFV3ZU0yWjBXcWNaWmlsaXJ6UXY5VTdQZTBmaThJZ1VZZ3l6bmR4MDFUTk5U?=
 =?utf-8?B?d0hnWkVjTDJtZ1dpZVlIeWRVSW5rZVViQUI1SG5OOFpHcHdOZXd0VHlTSGVm?=
 =?utf-8?B?YVNTOVFPRVZJTGtKenF4Tm9ScndFQzdxRjF2cmlZa2kzQmJOaUxDRkJJL0ZF?=
 =?utf-8?B?dXl4Nk1HUkhxYWF0ZWtDT3JEUlgwbk8xdERwL0twVkd6VDVJWE94UlJBUDRB?=
 =?utf-8?B?ZkxmTEVFem92WS9lV3RESG5kdVR2amFETlVwK2MxbTA5bytZMWI0dWZiSnc4?=
 =?utf-8?B?R3RQNC9tNkhMZFNXTHRtVG1LVmhwZ29mQXNGb3YrRFFXYmxXbnRKb2hyN1lI?=
 =?utf-8?B?Z09TMWVZb3d5N3MvVmNoY2c2WGZ0VkZEYi9HNHFINXoyVHdWczZwVlI1UHdX?=
 =?utf-8?B?TkpMVGNRUVZWbHhHd0dJUFFYdVBJeVdEWEY1M0FLbVZBOGdybEtyYXg3aUht?=
 =?utf-8?B?QVNYd1FaR1BGRlJEQVEvUHhZMVBpc2xLQ3ErTDluczZNdUQxd2RGcG9GYmJW?=
 =?utf-8?B?MkFvMHJERm10YXQ0dFkvYm1HaGt4NWNhQm1tQ1hnT2JOMjRkNktYVmR0eGZE?=
 =?utf-8?B?bVh0eWF3dU1wME1WRFRNYzFtenVkV1hVOC91Q3NPS2dQZmxPK3UvSFFnV3Mx?=
 =?utf-8?B?bGRpVzBHVUJHeGFhUHpXeDRORmU3dnFzSUEveGtUZU9WYS9tV0hRVWQ1MGlG?=
 =?utf-8?B?dEdYL0RwZWo2SjVCenNaeHVtK2oyOHc5cXNQVTRGWjlRcXVBUEI1K3hkeFBi?=
 =?utf-8?B?ZWp4WGhqOG1YRGo0dEdtaVhRRFZxOWtxMTQvZkk1aEUzMkx1V3c3VWVJVVV0?=
 =?utf-8?B?U25FWG1KQk9oWENJSXlHMDdvaUtlOWxRaWlrUFQyVHo3ZnZuanlhdUpZRXpB?=
 =?utf-8?B?N0x3RkdzcmppVHBRQzl5cmMvM0IybG1wYkRMa3ZZY1VPQVpaeXFId2N6RDZw?=
 =?utf-8?B?K01qaGppZHlpTjNpK2NMaG4xd0dVSW1IYkIyclpIQzVueU9XUFZCRVM5WUdC?=
 =?utf-8?B?RGJwUEt0eXVLNDlKcGNQNW5YSEYrNy93S2VQZlJDQzZ4TEh5TlpqWjBib0RO?=
 =?utf-8?B?MEU1MFZ6ZTh0RnBPeDdwYWROUTdLWVQ2cFQ1NERlK2lyeFNyb1NTSGJIZWNQ?=
 =?utf-8?B?bTllUiszUHV5RjNOSDNsV0ozMEtMNTFFYVBxU1lacmxTc0VpM2FUU2s2UHcw?=
 =?utf-8?B?dHhOVVl6MG8rbFNjbWk4Y1VNekJNNDA2ano0UFU4cEpublhPcUdOUWZXLzRB?=
 =?utf-8?Q?ppWapjtgn/QS3eKApEgFVZX/40z9Za+K3OaKc?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e9cb34-2860-4df0-6c08-08de5843806d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:46:47.4803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dEqS9dpOrGlMt2n+FMPmEU9WBvw5j7wmN0THC3RUxObMeeERhEURfyJqIzMTwugtXz2VvcfkWOH4tuwftG4Vv9qoMNf6tLHPSmtxWcF+A8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8152
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 16:46:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8607

Hi Antonin,

On 1/20/26 4:17 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove the mention of Poky containing BitBake, just mention BitBake.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/terms.rst | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
> index ab8eb6123..1e8a9d57d 100644
> --- a/documentation/ref-manual/terms.rst
> +++ b/documentation/ref-manual/terms.rst
> @@ -401,14 +401,11 @@ universal, the list includes them just in case:
>         section for details.
>   
>      :term:`OpenEmbedded Build System`
> -      The build system specific to the Yocto
> -      Project. The OpenEmbedded build system is based on another project
> -      known as "Poky", which uses :term:`BitBake` as the task
> -      executor. Throughout the Yocto Project documentation set, the
> -      OpenEmbedded build system is sometimes referred to simply as "the
> -      build system". If other build systems, such as a host or target build
> -      system are referenced, the documentation clearly states the
> -      difference.
> +      The build system used by the Yocto Project, using :term:`Bitbake` as the
> +      task executor. Throughout the Yocto Project documentation set, the

s/ set// ?

But that already existed before this patch, so

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

