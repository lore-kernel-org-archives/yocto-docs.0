Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B259BC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 10:33:23 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.81])
 by mx.groups.io with SMTP id smtpd.web11.3969.1646994800368396734
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 02:33:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=nz+oJTTw;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.81,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFsWlDVX/LRWB33Iy06qWuH5Bzte0aEAwZi7r2XRYoXlgBBcUimkeXm8lo2tDY0xkksxoXIUzRvFpMQdOZ330rO8CA/hIUnOIl660ICv2dmS0t13+r0t/dSbNY7Jo5qXahQIMCNDLiJesYs9NEpnlr0+SzO8yEsZQjQLUh11gBosCbOuKH/JqDlG1QarcWmfNHjqk8vUR5r9rSy+ED+foJmyhU5lm30odsPkm9C6BCSCDLqS1+UfUSgcZ3p1a7hny8p/5lq7zZwkSUspVI8S/MuOWinnASiWoHJprfCGAkANlZuLuJpPsYz+iQTnaPBWFwn6NwuxPe46XOdoqqxnjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ONm42FkcqALk2YXyH0JCtaPbBNnQ2ea6EJhtcHu2ic=;
 b=MOgdMbAQtMVtxGhlblFLsBsQxU3CaglyTU5LaOJUxenNadMnXftNsCeuLTOAcarjYTeSl8EwbTFP006sMTu0rrPQBhbQNZABKgB2jFwFUxbyUmo5qAEQz8LZbl+kPKTCyL7pZQXY8V4WNNIVTSdCDyE5SUXd3OXvFwZsyzk970DRYXPcdxNnvfsDp6exe//tLOn60I3QiHJVwRD4qKv7z/FSHDPZqD8XKLfn9hBCwKCpqx8dLtMO4/lYHHDwJ0bE8+Vi0jAGVAgU8uOeIE5rXP9ilDw4CpZFw0SMF20TIkop423t0piSDfUSaG0owPO8B4d5tb8olxNXMTXNEyl5Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ONm42FkcqALk2YXyH0JCtaPbBNnQ2ea6EJhtcHu2ic=;
 b=nz+oJTTwQRF9PHs3UckyY1KdzkUBtwgAi7ziWeNYsQgt1ilYkyqrhzJaCOm2ANg2GEWHrMD8Djz4b3e1C84BsmeEKIr6qrJQ2Wf5irDbqO0qwy5CSTv7OcZpAj+9a3Juh4aGw481D+Qchjn0/ykri9yZYFd0+S1L5x1wspFwJoc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AS4PR04MB9315.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 10:33:16 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3%9]) with mapi id 15.20.5038.027; Fri, 11 Mar 2022
 10:33:16 +0000
Message-ID: <dca70ef9-ae59-8612-4a61-2eade0d89b8d@theobroma-systems.com>
Date: Fri, 11 Mar 2022 11:33:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [docs] [PATCH v2] docs: update examples to add branch info to git
 URIs
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <16DB0C1CC1EDB54C.20222@lists.yoctoproject.org>
 <20220310150500.20425-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220310150500.20425-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0067.eurprd02.prod.outlook.com
 (2603:10a6:802:14::38) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ced16c69-f6a2-4f23-47fb-08da034a8d88
X-MS-TrafficTypeDiagnostic: AS4PR04MB9315:EE_
X-Microsoft-Antispam-PRVS: 
	<AS4PR04MB931536C965ED6B7666EEAAF8C20C9@AS4PR04MB9315.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PsjzeYn1+aMN5OcQ2y54ZpOkc1xnZXqTsomREPu4ZtLyDH8odtvk/ujrlw+gktCOADXlLx5leBEa4s1HOMxbl1FqDcxubjViLSBzrMQv+M/J6K8Pz/VUpryI2fjtKArDn/e+cFpqoBLqolmrLRe4+5sEEVblcSPJnrdaav0IcfvHglxtiVXJVsdleJP+N/lXsYowrmpVfeXe3e1fKbIG7LVTT0KXQ9yuGyVSdEJJyixXziuPFsswhzPhfuzntsKdb0sIF4VEjvr19/b/JzteYI1ZtNfbVeP9c/LREONxL7QvLaWcwIkVlG9F3gu7AivA79q+O+/B3BTPRJS0iD6TZjtGgie+vNiFFXw+7wOgNgr93s4QeqT6ZqWy/w6j8m4fOHO5AAMxLH7hACtEKSLDOjby4SxqtnQ1Z1b3lYdMwQnICl1ize2wF8bTnPFksHKEgFplkRTj9QekR6h5LkHjMtlNoNXeHUhSMrfr7ehhaR0UiuIDiVNQvAZn/qNkLEcBXS6BmeApFH06lL0nqlRLoVhr+97UIil2LKXuby19UukEw7aawH6LQ+lWc52GP41Cfk3g3HIEQA+ZIkz4YBkZeSCN9X/Aj7cwQz44k3L/nY6KRtnBYjIf54BQ7LP5ygkT7uX2//ANLiSY11RBUNx5v2mdIRtKYWy6Xj5+ZlR25En7IZvenOcOf0yg2ziYQ//4IiIph5O8StPPQPYDocTEKOuLS7C600ZNWLaZ4s9vKQE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(36756003)(6666004)(6512007)(6506007)(8936002)(66946007)(508600001)(4744005)(66556008)(31696002)(5660300002)(66476007)(44832011)(8676002)(6486002)(86362001)(316002)(2906002)(31686004)(38100700002)(2616005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y0hFZ1ZVRzRwWlk5Mmd0dVlFNG9wYVg1MXRxK1dtNUI5bVhOZTloNHZFTWI2?=
 =?utf-8?B?c1lCbXlGYzhOYnV4SVhWVy95a3dERDdRdzVJTVZna1BaSDNuYkE0RlVITTJ0?=
 =?utf-8?B?c2pFYkNoTjlaWGdXaGZjajh5TjNkOUo4dVdoZkl6em1aQzhoNVIyZWU3MThu?=
 =?utf-8?B?dlh6bUh3ZjVLZVNzQ1NPelNKZytqNWZBVFpKUnZHQVhJcThHTDVZSHN1c2s4?=
 =?utf-8?B?TmhSa3k0QTlaWm8xVFRRSXdaYlNDaUxyTHM5WGdEU2lGSnRySElIbUtXSmgx?=
 =?utf-8?B?U0pJRld1WjdIbVdLNlZzWHM4R0h5RFNJaUZ6VnFnYkhRSjRhcTZ1bHZyNG8w?=
 =?utf-8?B?TkhVSVhzYjdQVk1MTm4rMjZ1SGhMWTZ2RU55b2t2SCtIdnBFekgxNUZXVnpZ?=
 =?utf-8?B?ZTdnd1k4c0xiNzdwVzJMTGJFYnh2MEhsOXZoWXM3ZW5VN1JkR0swWHJMT3dR?=
 =?utf-8?B?SEJ4YThUd1pjeGJMSDJOdlpaUkNKNDRkQU94bFZqcHcyKzdTUnhBcndvSkhn?=
 =?utf-8?B?QVpCUUF1V2NLbmdnWXRrcm1vS3p3MzlselI1Y3VkM3BOd1UxY0lCd3V2bUF0?=
 =?utf-8?B?dmUyNExYam1sMGlZaGNWV2l3Vm5pdC9NRUZ2SFlNa05kNlNDMzRjMGNCU1VK?=
 =?utf-8?B?WW15MnFNY05Rd3ZLMTNWRkl3TU9VSVFqYlgwSVZUNFZFL3lUSCtIMVcwNG9D?=
 =?utf-8?B?aGRidHNJWWVqdG1LM1JUMHpTOEVLaVFJQmdTYlZsSU5JQTByU28waXlGanph?=
 =?utf-8?B?ZmRUdUFMMnJEMFp5TXBJVTNUcCtDd2dGbDVhbndaUjNsZlpEbHBmc1h5Qzdk?=
 =?utf-8?B?NFNMSy8zNC9adTRFZGJjaGFWOVFGRmZSREp3TDBseFBiSStYeGhjMG9xYUhL?=
 =?utf-8?B?TVlpN1llazZNSnFIQVFYakdkSzU5SXpNdHVSSktHLzlpNzRBOTVUOGQ2bU1S?=
 =?utf-8?B?UWFTRmp4ZUlTTkRBWTQ3ODJ4Q3Y3K0c2bC9KY2xRK1A1b1M4R2hhVjUvYy9w?=
 =?utf-8?B?M2ZyRFdHYkRFbjA1UkdPU0V6VXBrelRnMXpETElKa0RUZ3JDTVVNa25kMytB?=
 =?utf-8?B?VC9oV2puZ25HMjFlbzM5R0NkdXc0NGVVUHprTmc4SDQrM1VjUy9lQU9mZGl1?=
 =?utf-8?B?WnFxOVJHMU5EdC84M3lzdElBTERKYm5VYU1KZEVwWHNNVXZYOWpiY2tKaisw?=
 =?utf-8?B?ZHBSSVFjQVR3VGJGK0lQWGVHWmJHRDdtd2h6bjF4SXQwMm1za2VqR0R0T3pG?=
 =?utf-8?B?UVo2cU92d1VOVTVydGxuNmdzMTMyUWxJbnMyNXBoWVpVem0xSjdyenRBQ2tP?=
 =?utf-8?B?dUkzcURKLzdsYnZ4Y1hpSytWOVZzL1BHYTRDaVNyR0YxMHdZSmtwSkFJalpr?=
 =?utf-8?B?V1I0Q2JQMDNoVDRvZHRxNk1URVpEWmNuQnFpbUlIcFJ6b21INmR3dHRtQXJN?=
 =?utf-8?B?NFZIL1NHc0pPOEt6MzF0VUpRa3oreGFCaTdsNUYxYXRaWW92cm45RzFSSE5D?=
 =?utf-8?B?WUVPMCtsMXRnNk1VTzRENEZyblIzNXJFMnpyR1VPT2NBV0FCd1B0T1Yrckh2?=
 =?utf-8?B?L0VDQ1ZVZ0pPZmFJVE0zSEpJTFV1azk4YmF3VngvSGFoNlNkUzRaUDF6WTZM?=
 =?utf-8?B?NFFrSUJPQkRTMDNMbVRSZmx4dXl3ZlFzSU1GWkR4eDdpVjl6WmtndlBTeDcw?=
 =?utf-8?B?dDh1Q3dkSmtuNlBrcFM0N01DeEVGVm9rekROVHltUm9pYVlveWEyWDlGK1Iz?=
 =?utf-8?B?aGE4aloxSW1ScVpsSmJTY3dkL3ZVNHo0UDJIWGc4QkJWcjNRb1k0N3RBSGNn?=
 =?utf-8?B?ZlYzMWcxVzhJc1FtQjZrUlo1SEs4c2U4QTV4a0ZDS0lLbTVYd1JzVWx3UytW?=
 =?utf-8?B?VW1lalBnTWZwSUxqK0N6R0FuODVCSnVjT3J1ZlQ2MTZTZVRCOUZsS09EWWtl?=
 =?utf-8?B?elpsY2dUU3lJUUxSOEFVYW55RHRsTExFN2QweXROSlYvV2krWlpidHBnVFp4?=
 =?utf-8?B?SElidTluR2RBdmlTamVTR3pjR3FNVzBhWk5HQ0N5OHp6SkcwRFgxZE81UlFQ?=
 =?utf-8?B?R3hBUFcwSHpTY1NTYzhoYU1kK0JiR3RKNVpBdz09?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ced16c69-f6a2-4f23-47fb-08da034a8d88
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 10:33:16.4890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mBFLmt/ZUCjF/LrsgXBuB032lVh2TmV5/4/dkdfryV8/h4aYuWNLpjrbvPv+2JS2QSA+b5Q7Ak6RgY753kRlcBb9MC475Vn8cNu5SLLdnGaYv0tIgsRQ0c/vI1xphFxv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9315
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Mar 2022 10:33:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2595

Hi Michael,

On 3/10/22 16:05, Michael Opdenacker via lists.yoctoproject.org wrote:
> Branch information is now mandatory for git:// and gitsm:// URIs
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Looks good thanks.

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Cheers,
Quentin

