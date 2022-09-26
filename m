Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8802DC07E9D
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 13:57:28 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.56])
 by mx.groups.io with SMTP id smtpd.web11.28804.1664200638579236091
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 06:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1
 header.b=IBScxSwX;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.104.56,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3w8aNB4mSJxRQqcK9qACqfUTN6S9xXRyMfbvJQFqeR0kioRorB2fCa2zAB6d2EYlzXLtreuh4lHAXHM0w9DZOjpKYfTuLoq6GNb0AHwqGwQ55/zGwZxtyYJYjftss1QmGSIOdhtbNhR92TR6flXDFgnYHt057yL3JWGGgMMrj3xdCGilApUofM7Ksq+BNj+pqsWkCovkDgCdMZQf0gN6TNjbTy7EfUQM8HDrAhVG/uZ6dJFRLTXrXlcqzRHO71J3Lm8T89HxDJpbQQYrye76NRQ8TdWnIOeF7DkYrcJxBiRK+68apJ9+mnnzAj4TvY4S3Xgz7KUdj/PfwywtM0EhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmRKnHfD/5bC5LGv3LBuf3nXWPIhmerUq3veBfFJRBg=;
 b=ggtjBiM10I5LCsSgnkg6C1y5jIKp2jNJKO0j3fn1xdBNPkV0+iY9BVN1AuNpboefqeXIs4FWCEWqJtMJp0TPDoG9UPDJCKFfey6z7c1uuYWGDxkFkWqBe+TcfjAB9OnJztkkNjvpI9NympwDxJ9z3S2FJx/rR2nQgycv6ZfSLSbDYToe06uiSt9ZAvXsiyAy0vnlDQRhkv2Kwg2lJPy3i9IFjtXguqOo6U7OtTyPTKFhx5olyYH2Vqs4y+2mxqK4gOrwlb46G05p6GXU/p6QF5T+3eZdpCN4iOwiSdjLWgJ3obdc4ixXf9f0qjsJYeP/F31R130f2Dxg0hKxDvsNiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmRKnHfD/5bC5LGv3LBuf3nXWPIhmerUq3veBfFJRBg=;
 b=IBScxSwXVACKrXKQKht6RYSEhPvINUwmIx7Jf7hbgReqzVtcW76SMt3HOwBb+7z+NurFmwvrWaxpB+Eqw6TpdixJZJXfM7b2LxjIyoFTxG/WNwYWCf3QOZK2/GL0/6cdHbsRRXMcwQ6KMPY4YYEK4zNMJqXUU3QR3OquWjXRDEr+TrprptQ9IIIYJk7c4rwiNVHYbmQl9vgYZ+E+tbSLdQSRxVzWUkZp1BMd5W4mTzPWJqltZWF3OF5evGfkHIqXB5i+Z0pMrx1wZNaAEErn59vP8QDHyNZdeF2w6ehQvu+lpwz3elpLGz6sX1JzSSGkyXHl7OAXvSq58DSeEub1+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB7573.eurprd04.prod.outlook.com (2603:10a6:20b:29e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 13:57:15 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 13:57:15 +0000
Message-ID: <7d06b610-1df4-a124-6b2c-3637807b07a2@theobroma-systems.com>
Date: Mon, 26 Sep 2022 15:57:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [docs] [PATCH 04/30] manuals: add reference to "do_configure"
 task
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
 <20220923175219.6652-5-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220923175219.6652-5-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0040.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::17) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: a5acba37-a346-4970-3e26-08da9fc704c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1o+CQeeSNm7DCO4P0+VXSH6JutWgBRsSO3htKfGMlc3LtzUIEHjYhqUzVuUcMhh2xHymqNfXzUE26+tYyvjUGd5zDsKLH2nKbDi6TG49jWMeVYoTgBFYmJz82xY84PNI+aWcZb5aD95D1n+t6iAQur2hp7evtubMn2XnAJ+nDtx/+kJOdAUSnStP4eFGwg0SIJ9hfevIZWlTwkg5Hv8rccli819JcTT544xaxxaQR0kAJkSYd6Zmcq1RZ1fF86MVn7RERUPvBrE7D5rDaMBNVb2E5RNYjiTyMYw4d0Wy5D4CzxEqgjr13iENuyjxrJpyTDgTFimYH0p0PEGVamm2gSmpQSJT444SxBx6ClX1+6ppKoXWYi1bbHTVjQL+YDdSwowWuajnoUVjCPThzsUVfkSK2+Tjs3mu+gNRW3NkUGHlwZOIcRjBiPDe9JR7WZHMo2jIMn16idBRyr7Rg8OUrKcF4YzUXVE10wgovomOmiXAbpOrLfzPJi4KJ2UTLfirfGCVnDyit/Go/PDJnuBg8UPeBhd1BbtvTrI3yjCa0diRW2lvm/8sZqEv9NzHEtBVvd4MbWtsu4HB7jgE6nF+7p1aWOAdGnoXH7o5pTijIi2gLN+b1HEKKwSKqrMpVnxtMvNNu5XUpRMNnhVxQQduMtpP/Y2wqiVd3EcgyYTGROn/GAvlS7YSJJj5GsC4HgnprGhhCssLmMsQijTHHsZlKA3KUrfO0g3z6h3ED96cGbg2zzHwtbahSD5iQ8dd0HbSguEe/S5Kmq+Dnu/wUH+R+fRugAv3/zI+U6HWUhF3/jplZU7lPUQEB9AysHKrfAUR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(39850400004)(376002)(346002)(396003)(451199015)(31686004)(66946007)(66476007)(966005)(478600001)(66556008)(8676002)(6486002)(316002)(4326008)(31696002)(86362001)(41300700001)(26005)(6512007)(5660300002)(44832011)(4744005)(8936002)(6506007)(53546011)(2906002)(38100700002)(2616005)(186003)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cVI5RTljTndRNlpxTjVaMVc1WStzK1pvWUVWNHhENUd2S1N2aytCeWpoZStC?=
 =?utf-8?B?VEdncHNsWUMrYnZOVklNcDBHeTMveVRaS09UNE05dlpTWENGdEtwS1JLVG1V?=
 =?utf-8?B?L3lOWXhZaW8rbEFXaG1KU2V1WTk3VVpCdmtYZllNTkpuZ1NCUUluZHBmdkRs?=
 =?utf-8?B?UGFvNEQwWGFzNDJheDJ4V0NkV3A5U1IxaG85ZUJVYkdpeDNPVzNpRTBVQXN6?=
 =?utf-8?B?cUhnYnc1QXJwYy9NcmRaVGxZeVZlUmNESUkxcFA2YzRyK0V6NWw5b083OGVC?=
 =?utf-8?B?azArb013dHpodVZHQ2VFTTdCOUhNTUhyV1ZwdDYrNXNNZjNZN0ZPYnpsb0Ft?=
 =?utf-8?B?Mm9UQi9vbTA4bGREVTNlLzBXdHR6S05oRFFqQVFqMzdSV1BaT01KQnFCSXgx?=
 =?utf-8?B?dnBVeW1HTCtGQjc5MEcxVlhIU1d2V25XZmZTTEROL3Z5Tzk4dzRRT2xjSEo4?=
 =?utf-8?B?ZUpDNDlwdXZDVlpoUVlSM0NKWWYvTUQ1enh6WEE1ZHBqNUszRS93T1dvbVFQ?=
 =?utf-8?B?YUIrQTdIeG9nbEcxL0t0Yzhlem5lUStnWjU0aHk4NEI1c244aXlHaEZwKy9x?=
 =?utf-8?B?SWM3MVAxc2h6dktMaTl5ZkloNjEwNkNkWmFpQkZFcEd1MHQ5STRndXRHZGFz?=
 =?utf-8?B?bHFRcFN5M3JwUldhUlF5OE9kUitqcGw3QkJxdnVETDg3cjdlaXRNSjI4Z1Br?=
 =?utf-8?B?K2QvV0RyTTVTcE1hOWhiNGpMODhaamJMSTBPT3F3VkloZnl2cVFId0N4ekRQ?=
 =?utf-8?B?WGV6UVM1SktDKzNsanZvMzQ3QjUzVS94MExYallNV053dGdkczJMN2lkU1p3?=
 =?utf-8?B?eWtCL3lSR2hxTUdBL2tPQkdSWFUwMk83cDdsYTlhRU1sdmI1TlBGNlpGOTlY?=
 =?utf-8?B?UXhyVWlBVjE0YUpIOUswZXZtT2tqNDY3TFpqcnFrbkxHblpIY2JyQW5VTnli?=
 =?utf-8?B?a0pucjlzUVM1N1JiYUw0b25OY1RJeWcwY0ZHcnRSaGZBV3lpbTAxOXNhemZT?=
 =?utf-8?B?Z3ZHRThEZktITkNqS0syWFozWUM5dkFkSGErUjBodFI1V3RjQW5yZ1V6bjBS?=
 =?utf-8?B?S0E4U2R0dmEyRDhVUytsbkRhTGUwcWlkN1MzTjA3Y3NpOWwvZW5VTmt2Y1R1?=
 =?utf-8?B?dUgxZ0JacjAvMUpzQml2cTFndjVFWFh2TW5leWU4b24zSDNRd2J3RTJiVTZx?=
 =?utf-8?B?ckhoSjdndmRNTnBWNnRxS2gyM3JMV1lWdmpWc0ZmQlkvK1hUTE1CYnRZeEZv?=
 =?utf-8?B?ekoxc3g2a2hqU2FHWmVhdW1YK2VvZGdrMzdhWDlPNXI1MDZVQ3cyeUwvV2Vo?=
 =?utf-8?B?cmcrYXpaa2lVTDNSbTc1VWZ3TDUxMTArMjg2TDN4Nng5ek1mQ2hrd0hmelY5?=
 =?utf-8?B?a1FTaWdEbFoyd0xFc29tUVJuZ1RWQnpZZ2JySDZnTklMMGZaQUdFL0M5WXdG?=
 =?utf-8?B?dEJPcDkwQWtUZ3VsM3B1VTJlSGlDamJWYWYwNlp0eHFRTm5NSU5MaWFvYU1V?=
 =?utf-8?B?YU9lUGI1RTRqWlg1Ui9ya0tsY29UOWdaa25DQ1pxQ1VsSHJBZ3NCWnRaYm8w?=
 =?utf-8?B?clFidlJ2d0RMTXZCTHZYU3dzemc1eFlHb3ZyT0J2U0E4K2Q3NC96MUZyc2hS?=
 =?utf-8?B?bDVzdkJGZ2RsZjBUTFp1ek5UUmhPcXV2czU5bmVSV2UvVXZpWTlTNHZFK3Rv?=
 =?utf-8?B?RFdMRkUwTkEvcXlQakFzUTRhSVZicktiTy84T2JhcVdEblhSRkc3eUlLSEE5?=
 =?utf-8?B?QllxTUVlNWNhNkYwV004N0xBVkxiMnV6aU5aQ1Eza0IyK3lON1FnNDdFTXE2?=
 =?utf-8?B?L2JYTm1mY1hyblFLVkt3SlFQaTNvK0FlZVgzZkJVcGo5R1BRS0JURDdtd3Z6?=
 =?utf-8?B?STJ6YTJ5WjdGajdYNW1kM0tQSXlzRHRNSWVWaUplb05XZzNKZnVQR2dPTmJ3?=
 =?utf-8?B?WFVZQmdLd0JSbDZoY0NxMVU5SDdZNnBaRGZqcFZVdzhTYlJiZUJGVUozY1g5?=
 =?utf-8?B?M01iVjFyempabGZBN3dqRkpnV01wRG1qL1V6T01VRS94OUxDRDhOWmwwOCta?=
 =?utf-8?B?YlpIbVdXR04vT1Qvam9kT3VoZHpLV2dLS0tXcFUrZkovNDhtQllQeVljV3Yw?=
 =?utf-8?B?ZFVKdVB3ZlgwcitucG1HMkFObi9qZmpRVkNRYUdkd1ZPVUVMMTFlZTZWRy9R?=
 =?utf-8?Q?3BhXLPqFJZ5EJVywdpDkOZg=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a5acba37-a346-4970-3e26-08da9fc704c7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 13:57:15.5852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 42cxZ3ltsMqisZ3WxWHVKEW+FkDbQDQUkbckPbjDYYFHwr6hmw2y+dMCq14ZphTh7O5uIPx/8hhHKM0p4Nq1dedTnFSl4FOvmD4UF5eW18ezGakBl3vJjc8+O5zGj+Aj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7573
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 Sep 2022 13:57:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3247

Hi Michael,

On 9/23/22 19:51, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> [YOCTO #14508]
> Reported-by: Quentin Schulz <foss@0leil.net>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

You're missing one:

https://git.yoctoproject.org/yocto-docs/tree/documentation/ref-manual/variables.rst#n5524

Cheers,
Quentin

