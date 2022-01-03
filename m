Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B823DC433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 09:18:53 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.81])
 by mx.groups.io with SMTP id smtpd.web12.25574.1641201532154205014
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Jan 2022 01:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=L+UeXwJ9;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.81,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4iM6QG+Lc9x5XFBHHRnWp73WftaVgMh27YViaQ8DB/79oJZM9ULJqQHM2BeN/Kf4mFKYSiKYuEXN420kbBRfLhX/8J+P7bJ5RGjCoYskSdzPxR1pwNNjsvW3ucQOx2MVzONGoC2uvdsulb4yzBfGoetpB5jyHW7hE9+hKiGFDuji6cHRKtqfsOR0BofYpkxK18mfQmpekutaI21YQGlSdxGU8UNxh9kTW3iBzULw/jbaRgiAzgWnnp0Lb5/18iLXq2euozK1ZsT+sbobTlDOvyRX0uPcVmlauNp7Q452trMX2FI8d5tq7PUrR9q1B0FLYzOS3EXaKnhkh9uBHMumg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXlQvqP0s+tTe5cB+66hStKf1AS5T+M/3a08f2Ty/uc=;
 b=aelO6wa1rCpi/MBAjmrvoUvY6UGSRdoxIrK2vuuh6cPJp2O0nJkc6/XDB/ogYcvefU+kBNNd/pEvqJPs9UabgtZNq+9obb2/D+4hdp5/C3zaIxtQvTPg8d+ThwZyc7VIa4hCKtDnX+ZThzOr0NrH/Oq6nMfwPy3ho1I89QXi5fTB0RijOS4PLAwR+8+10InD99ozWLAF8iFd0GM2dmniYVQlXfkVERfrSb8s/B1g5nRMXFGDj7aQCb1kKr4+y2XiOwPldCG0tzMvu3g/lAVBVR5cuGexWEDajfcpcDBgn+v4SDen/gzlQM9Z40EsMuTc7wNFyOQLBMUm1sVmN16f/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXlQvqP0s+tTe5cB+66hStKf1AS5T+M/3a08f2Ty/uc=;
 b=L+UeXwJ9HsvnL0feeFvkaoLKZ/e1zov3WNW4TFLYTF3b/bvv+PiAkoVBbImllikHYKRhhcnUUbl4kVvm83HGifvORiQ3cLsmM7WdlHzJSB3bpIsdZUQx90ER3/8yELVF2+nnVRBg7U7VD7YAKo8Nkg59vx7AJRaBeIzckHkWXF8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by PAXPR04MB8910.eurprd04.prod.outlook.com (2603:10a6:102:20d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Mon, 3 Jan
 2022 09:18:48 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93%5]) with mapi id 15.20.4844.016; Mon, 3 Jan 2022
 09:18:48 +0000
Message-ID: <76d1f61a-da64-1485-7912-1debe0f64c40@theobroma-systems.com>
Date: Mon, 3 Jan 2022 10:17:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [docs] [PATCH] doc: bitbake-user-manual: conf.py: add more
 extlinks
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <20211215162227.2001656-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20211215162227.2001656-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P193CA0022.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:bd::32) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb7f279b-48e2-447c-19cf-08d9ce9a0c84
X-MS-TrafficTypeDiagnostic: PAXPR04MB8910:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR04MB8910F507E4CB1C4C81A4EE91C2499@PAXPR04MB8910.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	C8qI+Es1EUKJKVH3dn+pt0yObBLmO6g3FmdS//bj5q0SZDpiGbt8+PzELZcj++mzwkRrjzsOUNRd8R4xrNjCsoq3rgJU2Wc9EYuWn7jvKXYLJQQmOa6HanarunNEid8vgH2IhtkX8SNOgstfQydBVfuocxbfKM7dWpmHFq2a1iytUGt0BHUbTvyvX+t5kcC6NEanmTQ1112A5TI1jXZQORx/nuUR1VF4NHrNKlL0gulRq8pKnOwotNFCQpS6fcSq+tLlhDnr6K1ccCklj2P/WhQ3pcki+d+GWh3AQbq31G2yjP2ZnN06AKJol0bcwfgtyNckBEJ4ISEYVLMyExT0VsApiY1ACWLwyQ9cwwOqkXrW6x4Wgfw8dhV9RNoLgQC5qNterVAujiaDcyjrPMi2lGDZ61f137/BR1kzqy4woEPPozDNkVR7aA1q98kzUiAZuhl/p20GSf4u4chXwDE081xYAc1+6LVJ8eydr3Ewg6pzrhyx7zp69zrD2RebZR0YnL2ZLjELGsXJvi6PYouNqAXUPiC+/fTaFIKb8GWcRwM+s5CtlLf7yIQ9LUL7MA2RryGmF8nwO8mH/V8q3cLoU+Kd/9OJPq45OflvWIISwMiVOz8Pw+kwmc91IOLD7CQ/uZ3J2hWb3el+XR32aTI8uoyYXHwHUOmL1okpSj2Ji/H5krZBkS7CHa7XfkGKI8rtHisD5pc0Qi+fBjHmnttpWPt1zgc0BnzgleTZkQiHULU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(86362001)(316002)(558084003)(44832011)(8936002)(6916009)(6666004)(5660300002)(8676002)(31686004)(38100700002)(6512007)(66946007)(2616005)(66556008)(2906002)(6486002)(508600001)(36756003)(66476007)(186003)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K3FpN2Z4MzhqRHlkbVB4TjJlckVjRTl3dkVsY3FvU2dUL2l4TDNIVVA5K2xn?=
 =?utf-8?B?MXVkaUx2TkFTdDNBdklsSWdJZnVmRzcvZ1BTUDFjMmtVTDVXYUI3QTN4UHp5?=
 =?utf-8?B?czdTckNLQmliL1Irb2JpZ1ZUNjlMRmszWjdFQXBoV3hQaHRHY2lLU201VDUr?=
 =?utf-8?B?amhMek0rcTYxdEVpbkxCVEFCSThXSWE4RlAveHRVU0FUSHBkOTV6d3duVXQ0?=
 =?utf-8?B?YUFIQ2x4NEJqcGxGdmZWUWNMblhxSVdPTmYraGpGTk1TRnFiNnNPM2dBSnNn?=
 =?utf-8?B?MW15eno0dGM3VG5neENBWjZ1WjdOMklEdnZTbUNKbDFZMnorT1pMbXMzVmdI?=
 =?utf-8?B?OFJlaGsvQkd4OFhGV1hDMUxReHhsVUlTRWJpQmJKK2dZMjEvRDJ5MjdaSzA0?=
 =?utf-8?B?VFJGVTFoNHpWeE9peS93R3JpVGxJdndXQXRFbjZrZmVXNlRZNWFjNGpUb1M1?=
 =?utf-8?B?TzV6bG9VVDBiNW9HTDhCRVVpbnZYVnVQMzBZd1JXUDRrOVVwQ0c4KzV2ZXlo?=
 =?utf-8?B?UkM1Z2VmMnR3UWdHazJ6aW9rQUI0c3diZVgzYUJQZEc0YjVNZkJqaStOUnpk?=
 =?utf-8?B?RDZaeFV2Si9ycUFOTlp3SzdQV1pIUmJmWllUbzlQZlMzTGxaV2NHZE9PVnNF?=
 =?utf-8?B?ZW5MMEpha2FyMEx3dXRUL1VKQkdQQVpHTS90UHFJSHUxRDJPMTU2SnBnK1Bv?=
 =?utf-8?B?ZVAvbE4vbitoczE2cjUzS2RCdnNwclVuRnBERyt1WUp5SjhDSHB6eVVOLzR5?=
 =?utf-8?B?enlYU210WmJ3K1k4R0NVM0VoNkM0WnVEY2syd2Z3RWNGTThnK2x6YVhpNXdh?=
 =?utf-8?B?NWZxbjJUUHE5Tm1qSFlVUUxmMFg4U29RT0c2SHdiM3pyb2hXdzFtdDZJQTVu?=
 =?utf-8?B?YnMxVlNjb0hkcDExNzRuSzFjT0xXODZweTUvQ0NERlovazlWYnY2aUtmb2gz?=
 =?utf-8?B?OGs0RVFZR0dOc04wdjVIT0tvRVYxT09RM0hVZ1VHaXJqYXNEV3hIQUVMSmdG?=
 =?utf-8?B?aHVzZ2g1ZUhicUdvbnF2QWdMOG42VlhJbW50aFpQUDNYYTRWdlRmemdoU0V0?=
 =?utf-8?B?Sjc4Q0kyRUg3TFJ1U2JuRisvUnNHTDgramRDeEVLeitaMFpKR2Q0WGFBQSs2?=
 =?utf-8?B?MUl5eEFKL2NJeDQrQUpSODVhUEljRFRMaE5TQlRuckVRZm1nR0RLYktPKzJr?=
 =?utf-8?B?N2NVeXR0U2RUKzZXcHRQWEhqVmtRMHFXeHhIdXpFZ09mSysrUXpjQUIzT3pW?=
 =?utf-8?B?UkpLUDhSQmtWc09GdGlFUTQ2MldzVC9KcjdBME1LaGM5bTJiTklLbTRkNFNU?=
 =?utf-8?B?OXRBNEJsOEJTSVdiWUV0K041VkJUVS9OdWdNSWcrM0FjMnJ4N1p4UTZHeFZC?=
 =?utf-8?B?SWNzN1dGbE9yc0ptTlhkSVM0REVGWVNud2hjZ2NKY2NDNTJ3WkNmUXZKNVNh?=
 =?utf-8?B?N3lQMVB3eGdKMjRCTzNxSTdCYVdTb2lGVEpYSElpRGN5QlJLU051VmxKUVJ3?=
 =?utf-8?B?SDhxNGkycWNabEJGOWFJTFBqZmwrbG0vYldlUGZWL3JzVU9Ydk92R1J6VzF5?=
 =?utf-8?B?d3gvSUJLeFZ6c0RKemlwZStQM1BxeHRGcS9lTVhEV2FGek95ellFdTlPVUpl?=
 =?utf-8?B?T2RUei9jK2lZWlR6OUJSdlpUUlo1ZjdUd0N2RVAxZEh6b2VFQ1ZzQ3pIZWN2?=
 =?utf-8?B?WFljOXdaWU04ZWlNMzhnMjk5QVJoSGNYMlczRXdXOUY0dDlpT1ZkRTNrL2Y1?=
 =?utf-8?B?OWFPN2xDbEJ0OW9EeUhiMGRJL0FPQzUzSUtlblQ0ZnF1K0QzbjdSYnE2MGVr?=
 =?utf-8?B?RmFaU0lDSjIwOVJFbUlGTXp4dEYwelFiZDhWVVlJb1NUajRCWWhXSktKbVpI?=
 =?utf-8?B?NFZpN21uNzRKMGRkb0xtbEcyWXIwU0hYRzA1cmVKNkVmRjJnUHlta1JVYTBI?=
 =?utf-8?B?TWxOR0pSQWkxNFRmVFBzR3FjNzB1QlBrMHZRUXQ5a1pUa01Yd1pSaXladGs3?=
 =?utf-8?B?VCtoTFJWWi9kRU53c0c2bVZxMkVLb2FudFFXOGl2MWVJM0JXaFZndE1uT08v?=
 =?utf-8?B?c0tmcERreS9yOVM2MmJZYXliek1GbEVCdzhIUStwOFU5WjB2bFg4cWpLamdK?=
 =?utf-8?B?bkRUbmJGQXBOUkIyUUwrSEJJbkorUDZxdjhvS1V6MW5Cb0lkM3lMYWhPaTk3?=
 =?utf-8?B?QjhGbFBzc29wZFdlTlp2Q3RZWFB4VEQzL2hDZGxYVS9SNVhQK1BpU0l1RHNF?=
 =?utf-8?B?WnpNckQ2VmM2cmFNY2ZJUFVEekRlR1FydnR3RFlSR2hiUU4rdm5STnRvZ2RY?=
 =?utf-8?B?aUlwdG1qNi9rbXZ1WTFNYnk2SjBqYVppa3BLSFlXQTAzbE9UVUx2R2x1Vkw5?=
 =?utf-8?Q?U7sXBip9i7p7epAo=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fb7f279b-48e2-447c-19cf-08d9ce9a0c84
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2022 09:18:48.2404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aefRyHOiwZ/t8SQiSQKtwBK0w1FA7Ox+4EYWcGp8P36D6wcjaddBjxCoZ2siL8HpWoR/gAXgE0yLzXEYK1SUblJNH31t+m8pXxc5H5pOnbsDnhVpKmZEtwCxIGxAVUkR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8910
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Jan 2022 09:18:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2326

Hi Michael,

Could we have the new entries alphabetically sorted? i.e. oe_git first 
in the list of oe extlinks and oe_wiki last?

Also, is there any plan of using those new extlinks? I only see one 
patch in this thread, hence the question.

Cheers,
Quentin

