Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E42C43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 09:08:00 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.79])
 by mx.groups.io with SMTP id smtpd.web11.9976.1654592869451030784
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 02:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=maDOKFMI;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.14.79,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZNChkYxCngqVaOdw23GL+tjdbKFUGz5PQoWtdJNwkKDjG39VpOscZQ1F7fBuUVqWUkN/lee2tXYyNVVaDo9Yl4kfcfU+s41dbz2V+cz+7NAWRTuGOzjRYZp/mNLkYsgNOPYXsGCO64YoiLFAXHVbH9HQDSAI1sHf9kNRX9TtghDnwR/DNnVxhW88lguA4dH1YvYF4bJ16fAM0wtgQNt3hE9VlLir8g2km4k2Ey6cbqw62QMJuKR4EaEBZIPl8+mKr51nVGzfToDa7Nt0XDSvKEoJW6mh7PQ+vkwMmy21zJjBEhVGYciHPc7U+nOEWtCrOEupmTXmYCu78AFhvQ+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hu5V36Z1/INJf7D2XfZ5lF9LBJoj7b4eyxvQZHsAp5o=;
 b=hzv/nWYLTyln7DHDACcjvhLBuCkwk4h4PzeRH/znmtzauIGiAVwRcOw1X/M+Dt8Inz5hV5b+uMC28MCeA9feoaMVmmA4gchtR2L3iIFe3KxcNFAF+Cjgp8fAHw3Pez1nZHBrRTaUPHChsTnczSNSfNDvzYyDaVCCxDOxFqtxMOfDqMTWuG6P/M2dhhzXrZiDG35C9UpyVH6CA0I9btZDtR0PjOaVPhq6aPZCQa0N/VWVfL5IBlrX8ALmgPewCd2nZFCyeHUf8KJeTlLy1DgmIFyx08NPZUhMtjrGiRVf3KA2D8Ihgbhgp/R0yGFNrN9v2do6+pfQSWZ82e+yKR1+6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hu5V36Z1/INJf7D2XfZ5lF9LBJoj7b4eyxvQZHsAp5o=;
 b=maDOKFMISdnpd4Q/RYIOM86agUocadYQHuX/Ek0+e6uGaCzjyD0HOvH9xSLSYktgUu4Y3GRcPy5uVM/35lUMgWAtGPv9ZJ4bOHMOk407lACIeFB4PYzj79Z5TTcaMb4grLeMWoHGCP1kjOgPlHBoSMs2hxmuXXZQvZEDmLuCW5k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM9PR04MB7571.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 7 Jun
 2022 09:07:45 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::880a:6606:6f57:dd0a]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::880a:6606:6f57:dd0a%6]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 09:07:43 +0000
Message-ID: <bcfbb80f-83c9-f984-265d-3c6dd99c429a@theobroma-systems.com>
Date: Tue, 7 Jun 2022 11:07:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [docs] [PATCH] dev-manual: mention the new CVE patch metrics page
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20220606155943.52427-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220606155943.52427-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0068.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::45) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2117d534-6944-42c3-152f-08da48652e96
X-MS-TrafficTypeDiagnostic: AM9PR04MB7571:EE_
X-Microsoft-Antispam-PRVS: 
	<AM9PR04MB75711F7A9D760454D4863CF8C2A59@AM9PR04MB7571.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L7HZ4KDWT8vN7WD/ixF9RRXWFqs96Oi2MArcuodEYHKhddJ1Ys6xKlxUramasQxkQnqZYN4P9UFdXDoK6uBtuiNwwX2EYk5c+hMq9RixQW0Yjeq46JGA24KOl621kCoHv7nYSPQ1xdArJPb+zbhGo1UEVutIyQk4JRS+PgbK+1ouTkR95nApV6f1BJ4XmE0JbWDVill/RwtJP339orRJQMzVP9Ynx2NlrjeAgxv/25UtTLCZH2JNa6qSqG3p0tgfBY4v/K3Cl5CBdkNeI2dMslQZ1oVEf7zr5ts4lIhyxQ3LnX3R8V2nD3CTsYYlo9CNecsxT9GRyt0iqpufVJsIM5dYPda1SKLAIHTFyRXkjoT13xXPiAY6m09s55Jpv65HZ8STdsaVkpuQ2lb2073Vty1vdn6zGe6EiKW3nnQYhkXI5DiEUs/fxUDo7c1J590CMFf+uyc8eLfVE9Lu0xUHgdAl7dqe+Xccqj7acB238r2aOpPQTgJwB5T5ethXrfz6OznHtNoQD71LDlX55DX5sAz/H/NKzE4DUqiK3xW88cVMpYbLQYqglKIgFrCRmjpws+UgHz9w5qNEzU1+FWovnEImVHNt/ychV7qXBL4o1ewIkvIlL0drNVeOX3umzcowqKUySjLWkBDi28B7gu7EJ3Td/ZreMVP2oOPrrHEGFtaAU37ku9VmGlCYiCqtB8wiOUAvMLjdHMHKkuMk06wco5z88cYWDs8reSNGzWqhres=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(38100700002)(6506007)(53546011)(36756003)(31686004)(44832011)(4744005)(31696002)(2906002)(5660300002)(316002)(8676002)(508600001)(6486002)(186003)(66556008)(66946007)(8936002)(66476007)(26005)(6512007)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RElQa1pYWUN0bVppa2FPZFhwc3Z6T1J2VHI0WVc3bW5yOGJYKzh2dEhGc2Rk?=
 =?utf-8?B?bW9RcGQvRW1DZHdNUitYMURRMTI3Z09vU0pwZFQxNnlub2ttVzdackRJWDBG?=
 =?utf-8?B?blpoc00xWjdDMndmaEFOS0hFTjJPcnZSYW1icjdhdU5ZcHhGQWN4bzNRcFdD?=
 =?utf-8?B?QXdKTm9HbFNQQXhOUlMzRVdSNXdtcDBsMnloVGJYMUdzS2lscTRkeFJGOWR4?=
 =?utf-8?B?RldFR21Ha1E2N0tXT2VlN2hvbUI1MUFSZXNmcUpVNjlTdDdnaVFOcTZSakJa?=
 =?utf-8?B?Wkk2eGozMkx4VG1QQmFXcGFOWDhncWNBZ1ErN3Fzb0VhVElQQzgxVGtUaXNa?=
 =?utf-8?B?NjcyRnhUZlZaUGFKRjd0dVlSSDIzdHd5UGVBZCtURWhPV0FtVytqajlqTEpM?=
 =?utf-8?B?VWRNRGJLUW0yK2lZNTlXL3NVRExaMVhTcTNmNThubnFURWtmelpybFZaVDh2?=
 =?utf-8?B?T1N2K3Y2WVJnWEsyU0prMVBvZHlGbXJEdVRqdUFtajNaazN1Y1RGK0t4aXFJ?=
 =?utf-8?B?bVdIWjVXWW8yTEM3VkFmd1hOTjlIUmU1djVRUjlNWXZtT0x2NTVuTVJoK2Jq?=
 =?utf-8?B?eFhKOWZpUnpIYS9mWnRBc1BhQjlPL0FSQndmMW1FVUVIQmFTaHFqMnVhZGo0?=
 =?utf-8?B?LzhCZE9TSzdXRHJPSXNtNmo5SzB1ZEJVMDZRM3VhUktldHBSYU5hd2V6MUhQ?=
 =?utf-8?B?M1E4RTdwTEZYM1ZnSXlwZVFwOUtiZC93Qml0UWNxUzI3ZWgwRkQwR3RBeW9I?=
 =?utf-8?B?S2NwWGluV2RRZTNDcTJwa3hOdXNSSG1zZlZPVjRUYXA4RnplcEtQb3ZWdzVU?=
 =?utf-8?B?YkFjRlYwTEE5ZU5rQmVma0lJYkxMRnJDSXhpMEM5N095STlxMzBneTlzOGRt?=
 =?utf-8?B?cTNjS0lxZXBvS3JhbEdUWW1mc2lzOUVJZTAzcnhHVHZtcUtiOEVLNXVqN09W?=
 =?utf-8?B?Tjk2TklMdjBhTFp4WUhBWnhGYk9ZK0JNQmtmRXFVMXRXWm52ZEx6bGtXbTJw?=
 =?utf-8?B?WjNBSW4zN3dKeEpnRjNDenJPT29JNVZaUU1yR2tjWVRpUEdBaU95QnUrQXhV?=
 =?utf-8?B?WUE2VEkwVXQ5ME01a3FiVW15b2lZWHl6anhQLzhEUXZiSTk0amtCdW01UEZI?=
 =?utf-8?B?endDT1huY1gxeE1NRHkvVWRYMzh6eFdVVXJVNWZtd3RGY0pLRG96ZHJhckY5?=
 =?utf-8?B?NHY4SE5uMjYvQTU1UHFOZzNXbXVJWnBqSmZnUHlqbng0RUNOQ1lJS2xhTFVw?=
 =?utf-8?B?SXdnY1Y2TUllQTc4a3gxSnpadjlEbHdEZDZGT2ZibURaZEtQQjBuWGtCWmkv?=
 =?utf-8?B?TTd5dUZVNmFaVVl2cnVGa2dvZ2RiVFJZUzNCdWloaGFRanpGTDFlRHVRUTE4?=
 =?utf-8?B?dkYwdHVWQTNtM01iUzRmUTlCdnpvNlhNWDQ0dU9URno1ZWVKUWZVbmU0QUJ2?=
 =?utf-8?B?YjRKQTgxd3dwd3BnNVQzM1IyWHZHMCtqS2lIOVJLVno3RDN5MU53a3owcDlk?=
 =?utf-8?B?UzJUY2ExUlFHQmFjWjEzckg0V0YrcElSZDUzU0wwMUE0Q3JIMVVtK2RBdmxV?=
 =?utf-8?B?RVlTVWExSEZXQ2wvUm5KNHNwdHg2YllrZjYyMENCa3QyUXM5RXNyMnlZeFVo?=
 =?utf-8?B?enhnWldPN3BPMElIMXd5ZG1oTjE3cWRZYjRsV1pmcnExQ3hsU1NCeURhckt4?=
 =?utf-8?B?S2FlYWVSUkozeTA1TTZYWTJjWFQyS3laSFdtMHJ0Qng0OWdJK20vZUtRWWdj?=
 =?utf-8?B?V3JsWVVjREhicUJHbWprZ0thTWw4VFhjeUJYVWtNTWZRalg1VHZ5c0RMRXlw?=
 =?utf-8?B?cnAzQXFmMTc1Q3lCL0RPSkFjSnFQd2gwNkhLVzJ5QzNXcmZUKzE5UFhZcW84?=
 =?utf-8?B?Y0l4RzBIcTVoMXU2ZXNCSVhxZHdRbU9tV0ZzZG53ejVIbXhqTVRCQWdNL1Nw?=
 =?utf-8?B?d0RFd1lMeDVqZHUyOWgxWDM4LzVzbFdYOWJZZUxSVDJrYWFMb0dIRWcxMmRM?=
 =?utf-8?B?NUwvSitmeTRuZGlWaDNqejQ2eDEwRGZ1WktxUEFzZm52V210Z2IrWGt0V0w0?=
 =?utf-8?B?OGFsTUtMVHhNUThsTjVVV3dGZWF6TkVtMlpWekZaSUpsOUlTNCt4TmVHWmhs?=
 =?utf-8?B?ZFF1ZDhNcTdoZzBUOHBPWkE0cFlTOTdGWGtKTndPdG5nUm5PaThmZVk5NmFt?=
 =?utf-8?B?TkdiNWI4RVAxRk9tcTlEUmh5WnphQmFXMUhRU2h4R200WjNVM3RYcGNHbUY0?=
 =?utf-8?B?RFoxaXN6b2x1MFFlNkprWk1WaDNpRUNZcWRFSUw2TnBOcFgvWkZqZi9kOFcy?=
 =?utf-8?B?TGl2SW1PQy9RSDZEZ0hOWTJUL1dYVG5ISkpJc2R2ME5UclVDWE1zZWpyNkV4?=
 =?utf-8?Q?Ax42mh49xswXzzUdvQHZGwBPxvcGTlZxmV4rq?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2117d534-6944-42c3-152f-08da48652e96
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 09:07:43.8705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 huEa+TI+AR24PJBcE6GdBtPOepARwr7BGtx6Wxi0T47OeEHh6heCRxwhCMaAQ2loleeXGLXoHj0zKCijo1ZeGdxE54h+lV9yMlraDvlXpjXzuxp06cW7f4+7L2aesfci
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7571
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 07 Jun 2022 09:08:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2969

Hi Michael,

On 6/6/22 17:59, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Looks good. Was puzzled by the lack of extlink use but it seems that we 
only have one for autobuilder.yoctoproject.org which points to a 
different thing than autobuilder.yocto.io?

I think we should also advertise this page in more places than here? 
This is a very important document I think, so the more places we show it 
the better? Don't have any particular place to add this to though.

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks,
Quentin

