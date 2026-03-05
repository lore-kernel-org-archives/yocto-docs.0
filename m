Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9DDF3095D
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 13:23:13 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43960.1772716990400456877
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 05:23:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Vg0i4xl4;
 spf=pass (domain: cherry.de, ip: 52.101.84.26, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXwZt0ciReD6b9iVVyjpZXeDHPDRqekfffKDVx8ur4kBHVg7TSkyp99i/ZPAMI/5WtcB/86/nUhUE9LDWQ28Q+/VqcWi2mR1qNa8EIxoIWjtMxM0RnM7rANH2ReeUx7ta2fj6nR7vNFrsmDvEomR8E7eIMALwRoB4Hoq2phTic82DRqY9pKRdCMfcT2sW5BMsVg56CC1xhJtPHl/KRhJlDDi2qiSVDBe/dr53drLYIuCZn0nVE6OH3r/kaSOsrVuGQsWLBYzG1IpYedWUB3/HrZDHhY5BWE4g2dJ+0HVIIR/BsjFlbWThNTDONXt5Ov/0kXncr2jHxl2YF0/u9lFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJYLdG15ycbsnVey8bzLeVWcsbLLA2IhomoNhmT6Wfo=;
 b=eK4NGqGsVYImaI6/b3QR+vjjWGmEdTFTgT2i6wwj0jZxgEkZW0UMsK244t4yA8URh7jgZ3fkBbMuD3bZzy775TlQY56OE2ueGJbIoifCPVeUMuglZ9sUlw8pJnA8sDFv3Mrx2bwmFfTvnohpI25tC3e/vdXz7vk07TIioo2TpGWo70QsDwpynut+yNyYFI9hPiMHi5ibjGnI0FRJdO4aQtHXt/sMK0tbqe7vCofILKeseN/vGoE1KcHTCXG2mpLeBN11SWIgDcZvOPvhRabgd8QmiHIJMlR+lIMkxdfD3Z0UgFyRhsHO9HhdEXLH8Yrnv9QTBRf5A2akingb2bFJCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJYLdG15ycbsnVey8bzLeVWcsbLLA2IhomoNhmT6Wfo=;
 b=Vg0i4xl4i3XHwWe4ucqEbCO6VmTmhXK0sjj0TifuQuU54TVcUOjpBomEC9wxCYeEUp55+KnwJ83w3RYbH2s7/Ey0JbwNfz+eUvZtmjVHqL6IdV2jzc6Juz6TzgX/qacuoGhQhmeUT4vBW7un+KgevM6o4L6kPNCFaBcxpT81RJc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM9PR04MB8178.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 13:23:06 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 13:23:06 +0000
Message-ID: <0cfaf63a-f45f-45be-9133-cc78f3d36bf5@cherry.de>
Date: Thu, 5 Mar 2026 14:23:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ref-manual/system-requirements: update supported and
 EoL lists of distros
To: Quentin Schulz <foss+yocto@0leil.net>, docs@lists.yoctoproject.org
References: <20260305-f43-v1-0-5dbf939b079b@cherry.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260305-f43-v1-0-5dbf939b079b@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::20) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM9PR04MB8178:EE_
X-MS-Office365-Filtering-Correlation-Id: a4043197-ec1a-430b-6526-08de7aba565d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	mErMw/0XfOX9ZdeS9IANQOgTwS18jo8Z4f3gXvm5rSh7X26fcbPkwGuNa3MY5sgDBcowLKbn5EvGNngqDPbOr9s3h6LYgfks1ZGGUrLL5ib4VUEK7i8CkOU/jP5gU5GWpsIVm51WXUzky8G7QqwYuk51I6YirqDOUXe2IHLiV44xh9cYIeVaWQUf9J2zZ4FcDKM5OOJfKlvOWxvPB2nIxXLEg+yn4rJjyYUKjG2R40pa5657NKdmZZbjbcbnOUCFLm/eLUEDKVeufHFks89WpgVZk17RZsQEtWKQh2llAO7zPpvVnAI+FB6w9ZC9uBGyGcT57kqmPRVlGjWbU3/ivEmTvu5Jb4MTu0Sa6IDaxrJcOeLshDiNWx/2K5o/0R5KlXf3i2RBXwsmjcH9FU545Ar0xkzF28EnU14I0mEYTMLiUtna0kQjNfO1PJwxigm68IFiXay8rb7O+7iAsXUG7PWFWuWKV9qoe471eKVKtZEHJgqtzZLnSdI+9qtH00Dzi11uRKQoNrKcyTZiop8ucWAU7JSswa7JygjpqPD7jDk/SVn3df1ma6Sllw9NI0+VTYoYGj8wrwKPMv90sHN5XmnTi3LrWaE9HnoQ0gYxxOlzaBBKdLOBiqBB203g0GtvxGbkyW5TtVij1GQXDJBM8C1RxlS+ApTf19Nf4o5jK0b9FWMMoJe/NTDCEX3koQyMtBuSBGqaQTrLUmRH/8pLwtFdEYWTPf2pNJPdORYGC4E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bFpwRkhIcDR4QnkxeGJ2Z0lLWTg5aE9oTUtIMzFSK09tMUswMTZJSHFreVZR?=
 =?utf-8?B?dXliTEhTdmI0NTRWT0NxSGtHOUZvZ0xEZmovNnNqRDFldG90aXZjYnZWc1ds?=
 =?utf-8?B?NFdIZlEvaE8rZGkwVFpzd0tJRlgzOUNrS2MwYmN6NVJBRHBCcEZ5RnVWMXBB?=
 =?utf-8?B?UkVPRHNoYklEVWNRZDNDSitHbDhjOWtQdy93MFZrM3Ntc3EvYTB1UjNsOVVQ?=
 =?utf-8?B?Vm9ybmNta1RqendIUENvUnBzSnNkTGhEemc2OVh2WU5CUVh6RXBFVG5WcnMx?=
 =?utf-8?B?bkhzYzJSVmVNdHc3d0xkd3pxWWpkU2dmTUhCaDZ1b21iMG40dUNrMDhtSGln?=
 =?utf-8?B?eUVDdWwxRTZuV2VQMUVXUE1JWjdiTUtrUWJiY2dWL3JvVnpVQk5XV1M1Misv?=
 =?utf-8?B?YjVNbU84ZityTUVEb01yQUMzSndIc2lzSzZkNVF0WlEybkpWQSt3Ly9EZStV?=
 =?utf-8?B?NmhBZHNYRTlKeC83SlhxTlR2ZEVkcDJiU2lIc2tkTW9kelA3anZWTnN4c3lC?=
 =?utf-8?B?OHJCYmplZGlNZkkwbW9sMnhKQzZtaHQweFRUQ3lwbEdpZ042Z2JWMGkvOFZn?=
 =?utf-8?B?SjJzZWhpUUV5dDdJYWZVdUNxSzdTTy9BbTJXT0tGQTZ1aHA2cFJ6WVVCZjBs?=
 =?utf-8?B?M3dWZTUyd3ljL2l5TTlhdGkzcllwclVtNHZLUk92SzFuVWpBUW4vc1E4N3hU?=
 =?utf-8?B?T3FTVG84cG1sM2RGeHNMQlVEWllzeWUrSGpqS1NrUWN4RWlwdG1lRE1ENmdn?=
 =?utf-8?B?SDY2d21vdmhCWFNwcWpBTkxJYjloaVRZRVQwQWU4eHprZFFzOE81WTU1Wmdo?=
 =?utf-8?B?VmQ5ejk0SnhoeEFlWU9sVWFkYWhHZndxL3EvaDM2b2dVQ1lDdUJ1dTVmVHlh?=
 =?utf-8?B?dTZPRThPK1JvYmJrOFdrclB2UHZqaXlQTkhuZ2ZyL1c5Q0hJeFF3VXZZQnQv?=
 =?utf-8?B?M05HbitNRnZ6SVRpaTVEeXlVVkNvTXExcTAzK1hKM3hyK21QbjZlL0xhMS82?=
 =?utf-8?B?RHN6L0JMclVWdmpvNnphbkdSMW13WUZQUDdueGM0UEtSdzFVOUlHTkpNK1NW?=
 =?utf-8?B?NnlRY3NNWmx2WXBmTlVPQ2ZGcnE1Y2ZOYUw2WkdqQzF2dXdmalhOWERPZlJ0?=
 =?utf-8?B?aVE5RGpWa2c3UWF6QWtoN1VBcHlMVG1nR3ozNXpja25YMHN1dVJ5a2ZmWjc4?=
 =?utf-8?B?bS83STRyam5BYWQwUnVYbDl0TkxUSHAwSDFQditxM3BmUlBUTyt3VTZFSHd0?=
 =?utf-8?B?MXVJdTJMRDN1UEIwN1FOdDNYOHQyOEZXNFB2U09tUmdZQzJ5eDE4RDNSK0Ry?=
 =?utf-8?B?RjFpN2M3ZElkM29LTS9uYU0rUWQyeWxFcTNsbVNWdWxRVS93Q2I1T2RraXFn?=
 =?utf-8?B?eXlKWi9BWUdFSTB6WUdUZUR6aFFRSEFVSUhWR0ZaNHZubzNoMHgwbnpSaW56?=
 =?utf-8?B?YUJnTnBkNk5tZ0pRQ3hta25GdDRzVkQ2S1Z4TUdRelVCZG9MRVRLdU1kdXpG?=
 =?utf-8?B?N2RwRXVPMTRQeDFxbW9TdmU3cTF3ekw4aldTczg1dEtGR3UraHlkUFB0OFl5?=
 =?utf-8?B?NTFIVjRjMUpYMXFrNVlITDBrNmJiSW9OYzJuVVJhRWZmV045NCtwenNrTDFl?=
 =?utf-8?B?YWVIVXVpWXp1bHVQanBPZlZXWE12WEFLMCttK1JuVFpzaWlXTlhmR08vT1F5?=
 =?utf-8?B?MkpUZTc3M0kzaFdjSFBEbzRXWDhncUpLZ0xzWWVDNEs1dFpYSCsxdkI4ek5j?=
 =?utf-8?B?b3h1UVcvWjBIeTZoWFl6MlUzZ2pvcklYVG9TUGMyd2w4T1U1Vzl2MXR2SUtk?=
 =?utf-8?B?RjJuNnF0OG5kbzZHZ1M4SDJ3N0RBRGdzbUVydGMrSkVKZHBCbDNwQjNnczdB?=
 =?utf-8?B?TzlvVXlsVWZ4L3F2NVRvZkQxUE1KcEVxbXNTTTBkd1BBcnVlNFIyaFZPSzFB?=
 =?utf-8?B?VjBVdTB2Tk01SDhYZmUzc0Y4SmgzdzlORWZMcEVmUUVrcDEweXpzbzZ3M2xp?=
 =?utf-8?B?S0I0TjIyYjJKNWkwakpsVFNxK3lYUnhuV0k5d2NCUmJGdWxKOStsOG85NHhQ?=
 =?utf-8?B?bzUxWjJ4cG9lS1ZKRGpUN2xHdkVNZUVnTnczL3h5aFRCc3pKTS84OWJOQkxW?=
 =?utf-8?B?akl2c21KK3E1djQ3UnpOMUR4ZWYwRWcwSmZBdENDc3IzSHFBMi95bTVsR2xu?=
 =?utf-8?B?UFhxSnN2WjdpSHR0djU2Q2RIUlBpdmx3aTM4RkVLTnJUWVJ1eURacTQ1R0d4?=
 =?utf-8?B?WHRoaTNnQXZQdjBoNU5BUXdQNXFKcUFNYk9KYU9uZXBEZm5IU0VhQndqbWJ5?=
 =?utf-8?B?N1Y1NWVldzEyd1JDWk8rMEtoQmxyY25EZGFwK1ZkVk1YbUQ2RFl4WTFOQlBN?=
 =?utf-8?Q?AH+ACVVmIg86rxdSW7rmXff6zs2S8uo7N5XMg?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a4043197-ec1a-430b-6526-08de7aba565d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 13:23:06.5556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pU4VDtNfWcFD5pX8CuFf6VYtH5J4rBKi7vEubDEB6yVDRoOIMZMkGTwXLQRB4TRqFzDqn426iSlF5ldlXxJCleabmsvc40mGkZIfHcoM9QA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8178
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Mar 2026 13:23:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9068

Hi all,

Please discard this series, it's a duplicate of 
https://lore.kernel.org/yocto-docs/20260302110446.132075-1-antonin.godard@bootlin.com/

Cheers,
Quentin

