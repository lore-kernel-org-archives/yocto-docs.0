Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B35C433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 16:33:21 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.48])
 by mx.groups.io with SMTP id smtpd.web11.1255.1665073998019243116
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Oct 2022 09:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1
 header.b=GF5/ahq2;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.5.48,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNoQ4LMVCKDZKJ8TRd/a3KRjP8pGlHA/ByL3JW2l6lALjF+C0H1PzMOSF/iH/G/7kqQdz/pOnqv1h54b+utTqeH+1N6htSaXficm2gHhPUqf1SZvFh4IC5wBH3uNPr5YxS++zExJKBOxFgSXEfTDCwrhEyzsQCpw+wuE+faCYx9XRCupJI+ZyCeM/TwE5qk4gc1o1wfwhQSY2rPVohlSpHjRGDGXlYH6eouPebT16xalk4tSwjhEpvsmWueXTHYnP6lDId2V6aopIVUdb7PhzjVXuGl7eHp3JE5e7YdMtk5H2jLO8s1V3UThzjSdYUZePhtCBuIsqI7E3SsQoIW/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3uoxBuJqaeYav3+EtcHx/yZmDeFBi+wwWVsjc34/Sw=;
 b=ipoTEMIi8UHQcX8pYJe5eiYrp3gOVuM5sNbCupNfZ1vaBBcPuk83nbj9aj6bbdWfoNyFLAyYYr44WPC4OmLxys4RXSveL+uSAioS7N2o+wudu54EePLC2y89SjVj0rcGNRIEeMvtJ+uQvzy11RECvTgrdr7OxMsaJfWjoQajsneD9cyWodqg8moaKXWtBK9//N9pCOXY+HL2V5NbPR0ZwwlgZ59w51hC2DcvWJLUt3zyUV23pMUAJlv9sqfteuoiJS50mUsQSJGuhzs9id5v28TWnppp2tFX7KQ4XB3kU9eHC9RmaJcn/B/SrVo0YcMNZL/kgkmfWPwSfiDloSumkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3uoxBuJqaeYav3+EtcHx/yZmDeFBi+wwWVsjc34/Sw=;
 b=GF5/ahq24iFsAkyYezcLR1stvd/x4+TDse2kOv3LfhSQeC21Tt0Y1DYg36PHu/WhyAry+3QEBfltLzODbbKKm2xSkO//z8RadkEKfbnAInuI5HTUkJ3hBAoyyYuVLfeNpzhwXWkpc79lMYk5nMGMrCbaHRrVqULwTX1duB+1rX8TyPyWsH68i/k/Qe0/mGKnWxOmmrKoSXOabTZ3czLXvo1NQDYdhBUjinRqyouwHXt276yO2RxducD3ohayX0m2itEFUI1yFeD+tq6+4DEzqpVKQQgAXTE9tA9+gy6Ri7PpspRNKD1JINyPYc1YK+v+FLfOeGL0QsPjbcwcyI9U+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM9PR04MB8539.eurprd04.prod.outlook.com (2603:10a6:20b:436::10)
 by DBAPR04MB7398.eurprd04.prod.outlook.com (2603:10a6:10:1a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Thu, 6 Oct
 2022 16:33:12 +0000
Received: from AM9PR04MB8539.eurprd04.prod.outlook.com
 ([fe80::21d2:7621:f8eb:e82c]) by AM9PR04MB8539.eurprd04.prod.outlook.com
 ([fe80::21d2:7621:f8eb:e82c%4]) with mapi id 15.20.5676.034; Thu, 6 Oct 2022
 16:33:12 +0000
Message-ID: <87ddce34-b980-0e25-6e33-6af5cb521bf0@theobroma-systems.com>
Date: Thu, 6 Oct 2022 18:33:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [docs] [PATCH] ref-manual: variables.rst: fix trivial typo
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20221006155512.3092935-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221006155512.3092935-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0501CA0030.eurprd05.prod.outlook.com
 (2603:10a6:800:60::16) To AM9PR04MB8539.eurprd04.prod.outlook.com
 (2603:10a6:20b:436::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8539:EE_|DBAPR04MB7398:EE_
X-MS-Office365-Filtering-Correlation-Id: f44de630-0cbb-43ad-84d0-08daa7b87652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1wsmVsW4rEKshMXMyT8jIklHiDFrjz24g/urPctd7QItB5V+OYbkO3DpKTkZE0BlzNY1JBaHsUeJsxRUDno6cnbIwu8fK0NAHu0qpuZ6qtI431aXJi2mjAY+dMnWDdyXfiT0OUbM0QLSzcCGCBt4bTUgKEe7v8Gc+6Yn4BIIoqqUnSRjpGPtkGh4PyNQJR3SzcYsjUZV6V2G0CB98b1CpSQJlHP5a7WXt6HRnj9JXQfke1LAXoa0wl3oR3jccNycwZs4KPigBIfyQleiw0OFZHjehJNnGcAC9pDcaDRh8xihCXD8wvuWTxPxCvy6fQOpix64mQxb40A2nJv4UcDTVqeWfwSYTEVhVM1yW49X3pi0lQ6fAzz9RRARI6JI9AgJQLBKLeXfRHFcoMK+zkc7dXRIo8bDpo5PnaUM9S2GN/u7gjWnzftcGZVjTr/vx+yF4LCET+ivHxQJbwMzaRhRwvkcXK9M1Wz035+MgHFOEk5G/+EvtJNU/fYUyLpDyCqaAKpX95ZAhcnaK9Gjcha1gMVrOPeWzbPlflVb9kgVzlObISwqBDRdp0JuvX6L3CToyPpwiid3uGyl+dAPh+NnPWw7trxRkBxKkR/bGkDkzotiB9+cfnY50E4ZCE+GjWi4QCcPBoCVIVn9LmhE63nvZlZinXXcGnbYLErAEl8X82zpfSJS6p++kj5+okNYR+zkC9j6b7zEH4nTYgNd5MJfi/doLKhkB+2Zoximt8pFJYEK3QrjssIKJUkLGH2i2/vJ6CbLhONVE2NT+rlgOJpNdkPZ2jyEz447ol/Vpa2TENM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8539.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39840400004)(366004)(376002)(136003)(346002)(451199015)(8676002)(6512007)(186003)(36756003)(44832011)(8936002)(2616005)(2906002)(5660300002)(66946007)(66476007)(66556008)(83380400001)(41300700001)(6506007)(53546011)(6486002)(38100700002)(31686004)(86362001)(31696002)(316002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cG4rSldhcG9BY00wbE93VFp2aC8wUDNrbERYY1R3VFJOV3E2UFY5cnlYUVNL?=
 =?utf-8?B?bjdPNDRxM01GRFBBVGhoNndBTGNIR094Y1hPamxpSVFPQXg0RHNxQ0lFQTIw?=
 =?utf-8?B?K29VdVlscDQrQ3dnNERwNGExTEhDVzhzeS9YZkpLT1YwSFArM2RBd1JOZFoz?=
 =?utf-8?B?VHJBMGhzN215ZGdURWxucW5vbEhBVVNuZEJYSllaVGw4VlZvditNSjVvTGh5?=
 =?utf-8?B?SEVSbWQvbEhoOWl0YXFYWUFnUHBRTWl2UlBEODMzdkJYeEk1djdLcEdMRjRo?=
 =?utf-8?B?WVp2d2FsN2piUWphSUFkUmdtbzdLNVc5L0dFRENheHlrNGJLZTZPOVJoQStD?=
 =?utf-8?B?QUtDRURWemFNVEFTQWhEWE05VThKNUVhdzlhdDVublBDaEhrbjlSODZMclB3?=
 =?utf-8?B?VDQ0MkZTOVEyUXpsUm42N1pLUmZwRjFvTUN0dDJsQ3Ara2xsNm9Rdy9yWEYw?=
 =?utf-8?B?anU3NGluUUVGM1NhaGZidmphWjRXc2t0eHpIT1J3eXphcFJoazhIK3M1a1FL?=
 =?utf-8?B?T0o1dXlCQlRleSt3eG5uRUJGOW1KTEVmeDhxTERsWnFzenhhYmtqOWZ6QWJi?=
 =?utf-8?B?ejlQK3N6NHIyZ29iUnpVZ2V2bHJyZmpLQmtrbjRsdzFsQ0c4WDZ6azJHb0hJ?=
 =?utf-8?B?VFpnTVFOS3dYN3MwRHdsYTVsSEVHTHZxdVdibElqRkRicmVzc0xuUmx4bUtN?=
 =?utf-8?B?T1llek1jVUZtR1JPV0hjREU2aEVvTVRlcldPdWJEZXRvQ0c3dWNqWDEvcys0?=
 =?utf-8?B?MHZIVmdiUFhFVWxIYXpnNnd6TGREUHJIZmVBc0htRXMyWjRPbXdUNjVraE1E?=
 =?utf-8?B?MVB0U2NZdVUyd3lkcmZhOEZYY21DVnNOS25ISHExOEU2L2xmUklSRHZiOEF2?=
 =?utf-8?B?Q0RhSlFwMEVDa2xwampiVms2d0h3Y2hSbUZRSU5hM01GcnNKZFRRS1F6WkpS?=
 =?utf-8?B?UGtDYlpHMFRZQnZjNzdwcDQxaEVMU2RWbmM0QnROUGRGTmxra1NoTHNHakxU?=
 =?utf-8?B?RHhWbVpqY2tmMkN0N0dNS2J6WGpIdGo1eW5qdnFWRHNEUEJHVFlzOFd5Zi9T?=
 =?utf-8?B?V1ZXWGhoZExGdS9GOGl0UytwSGx2VXFrREhuMGx3K2svM25IZzkzakxEUUl0?=
 =?utf-8?B?NjgrTzFtbms1aXlwUCsrK0NhTXdrWmt6RFVzSVU3dDBvZHFSM2NKNmVqZjRp?=
 =?utf-8?B?aFV2VVgwdVo5UzN5U0NBZVE1bnBnaFhOL09iS2NVSUVVdE9odjJiSnlJNjgw?=
 =?utf-8?B?eXZlZkc0YVdDRndTbm5DenNEbUxaUDZlN0RTMWlhU0pKbDVWZkhSMVQ2aHhX?=
 =?utf-8?B?QjNqMEpOU1hPd1c5WGlWRkY5cTJuaytHL0VoK0ZsK2IzRG4xc0x0blhzTldH?=
 =?utf-8?B?anhQSzFZbXkvSENYbzVtU0RoVys3eS95YTM5V3h6TWl5UVdOV0tOWHJ0aXdL?=
 =?utf-8?B?dnRCbWlvdzIvMWZGcVduM1o5aGw3anI2d1VNTGlUZ1JmdXFOQ0JOckRreDhh?=
 =?utf-8?B?ZXVta09tRFZ2SUpGeTdnVVRvZ0FncCtLQlhTY3JPcDJabjBnT3lSVmV3Qlhi?=
 =?utf-8?B?SjN4YWxVZkFSdXRvT20wVkRPcUlmKzhMT1c1MDd2N2VjREtXNjhnVTBZQ2NO?=
 =?utf-8?B?VkE0a2lFVURZQ2tlbEZ3ZnZYUmMxd3BneXhvNjRBWjR6UDRBRFFxdFRjVmtt?=
 =?utf-8?B?dVF0V2swbGxDSnJFRWxtQU9kREx4eG9XeUIwNytyY3k1UHVKVkdDN3ZxQUN5?=
 =?utf-8?B?SERpNVlCelBtNEhaRS8vRzB3L0ZrUjl1Ym5FelA4Nk9kUkpJNk93eWVjQk93?=
 =?utf-8?B?eWtyL05NcEdHVFB0VlFxWmE1SHdXUzJIcFNiUUdWREYrb0MxTTkvTHRNaFdY?=
 =?utf-8?B?eW1ON20zUmJPWTlaWE9RZnBqUkZvSEk3aXNOU3dMYm5qODNvQU12RTZ1VER2?=
 =?utf-8?B?b2dmOEFyQ0RzVCtVdkFRbWVadytaMHdiOVY1TzRBY0Uvekk4b3FvdXMrR1V4?=
 =?utf-8?B?cVZtbkRFRE5BNkg1Z3VzbDBhekpTeGUxUnpSV0tRM2dSdEQxakhvR2s1S2s1?=
 =?utf-8?B?cWNmcFBzQUlOY3dDRjNYNHN0YzJoN1puaTBjRG9LTUsrMThZUy9ZcHM0alBJ?=
 =?utf-8?B?UUw3YW1wVVV3MHlKNm1xZjhSaHpCMUNpTVpNR0pMWlR4MGVsTWRnOWNyMTNR?=
 =?utf-8?Q?D8GIaNKLx5Tzmb1ygEUEaE5K/AIPC58BO8m0Yyy18pGj?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f44de630-0cbb-43ad-84d0-08daa7b87652
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8539.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 16:33:12.8224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rtFTCrCqskXfiAWGakRkXLg0OnIepvcyXcu3xtFJYeoPMC7dcRVKQpCS9W3Xo8LWY6WE8trq/T3/8RVe0DEQjVr8YQoM/2WEhA1nlchAufmfIAJOV8KCkoZ28vYM/h2f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7398
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Oct 2022 16:33:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3299

Hi Michael,

On 10/6/22 17:55, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 1685a26776..29ce22bafc 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3546,7 +3546,7 @@ system and gives an overview of their function and contents.
>   
>   
>            Although you can use other settings, you might be required to
> -         remove dependencies on or provide alternatives to components that
> +         remove dependencies or provide alternatives to components that

I think this was actually correct. To be read this way:

you might be required to remove dependencies on (or provide alternatives 
to) components that are required to produce a functional system image.

Basically it's a nice way of saying "it's either broken because there's 
no replacement, or there's one and you need to select it" and "we don't 
test the exclusion of anything that is not *GPL-3.0*, so if you do, 
you're on your own".

Cheers,
Quentin

