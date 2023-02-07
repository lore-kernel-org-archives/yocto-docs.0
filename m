Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B61A1C636CD
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 13:34:51 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.58])
 by mx.groups.io with SMTP id smtpd.web11.83409.1675776884055735560
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Feb 2023 05:34:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=ZsNHIRSA;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.58, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZSjqGYcPWfw/jXWTQYFMGoE3L3yxxzx4WF/25O3qDaLw9L1lVk8LiS/F9Kj8xfn0zZWiqzcaRmEpR+rN5dqG62Q1MMlunOBMr/2dlGSsLrMYJLo592IR4ayjyCGKvTrtUPIV1AXLxVAp/9ViK5ccfMPcdHZy0tFXDLrTPdckejzhAQOZIbivDAibwyUfDx6hjDUZ1/Xm7l0UZHfuJx5SJSAh0anV0Ra6vQgR22TOE9flSBgCsh2OMPqNuzVIpqs60SBBqOcp/Udol6BwASS/T+k+lnA7FWHDs/lx6L+1Mf/DqQsIOVVLAyo3MH5c+c2m0/KNY3+ukV3s5rnxgWQ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlXIiVBPGsJyNHxQZA/ijCrVV4vRftioEnmNwqURBMY=;
 b=Vzo0YA77VacRquslC6HTsXiPsVduEEp6hqLo2XSQoas31IIpnXpmnNLfkrqaa8hrwycBCuZgRq1hbyE5BIB1Lmj6xAZq55NE6GQtmWBdlI1DfRinp5hUqe/zfdWDps0mNs0uqlz0K36NzN4o1UqXa5wx4LIqfkZq7+ErtaI7G6Amhsqpr1nZAcbEIFR7eYSzeWoPHXMy5rTpbhQmAWYvmKpkj+O6QlbZ00IfTvyq/XAvYYiVSLoK0S1A7hMZe5mBkECCoZ/lz4RKrvA/GyVIuqS1UrFNngHpgSfaVzd/f6nbWzWRSKRFs5uQRo00IwmhYbaQuE52ikSXJXxkT1oXCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlXIiVBPGsJyNHxQZA/ijCrVV4vRftioEnmNwqURBMY=;
 b=ZsNHIRSApkAIkZ49BrUltNXKpGMJ0SEtw0QhyJZgm17YntUOd3Jop29ER8+GI+vcyFUO2DniKUofjHmhP73K7MEO0he9SqiEl5cYYH6Xv2ss7DXYXJHtN3xernYv7pA/BwVr7cwOByN8Kc+jZogKtL56TTQU/NuXcFrMD45OfHv018Ujj+x7FKEw++HWjXbADLWZQGQqAL5/vPiosPDs5QfkWnPSTsk0K3ORCQ+RwpyOT75Wh1xxhviVXIEe0g9ePkqaCu8Mcq6umN/fDcjnkvxoKa3KIrZHaRnN2gRxePv6KMijuSHTNqUqlP1914LLH6ep1wI7NsPWbf6ZjuAz+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Tue, 7 Feb
 2023 13:34:40 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd%8]) with mapi id 15.20.6064.036; Tue, 7 Feb 2023
 13:34:40 +0000
Message-ID: <86ed9cea-ea3b-824b-e762-1d26547deeb5@theobroma-systems.com>
Date: Tue, 7 Feb 2023 14:34:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [docs] [PATCH] dev-manual: fix old override syntax
Content-Language: en-US
To: =?UTF-8?Q?Ulrich_=c3=96lmann?= <u.oelmann@pengutronix.de>,
 Yocto Project Documentation <docs@lists.yoctoproject.org>
References: <20230207121901.911003-1-u.oelmann@pengutronix.de>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230207121901.911003-1-u.oelmann@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::13) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DU2PR04MB8822:EE_
X-MS-Office365-Filtering-Correlation-Id: f83c5573-f2a8-4662-5520-08db0910105b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	l9fHksW4YQQWCyHwCifSClytEvcLCxh4fk3EWcIxfPR2uR4mGsaQEMe+N/rJqpiJMVpMFHtsA7dO0aPbqJopzi2PZdhw2kmkxfvByEIT7A0fsNgqHJCybfXE4Ap8JEE2+WGXnzlwVvMx1RaQEFbE/svdGODHOE8qk0W3p5vSXZzSULrks9hrIjIP142BNh+uAWT11lWlAepL/+KZMDw6IbLmQ/eaf1Zvfaz/CpZmjbwXMlnoJ+oIyMHzeFMb/KMXqmQJXEaKrIc9PYzSyJS2uZ2ISt2f7oEk3RZnkeZHnf1dBvXS9fKEMeIqYubx4MB+O8PegVQKeYH1B2CWVJsm3moBRiHR5TF55u7tNWLqT5jPkBxAdscdkuJIGLQ1Bp7QW1YImnzmfDwMw5h99VqITXBiH8U2MOf3gW6/ADIYbYCBPm+qhYvW6lcw/eP6Rf7umrsoRsfRDep8KQTw57J01Xk6xJtBSYuuJV0pLZGViTxLiRtImcI0I4sqmH8cgRsDOq4p7IA6iLdapLKWPg6jb640lnNH1EByun9NqsglCMti1kmLSSKnMmQm4G4tgh0VdS5C0+OIRdaxaJWAQ84orwZ364+tNH5wqx8hYh1zPM2H8YpDurj4D51fBUrLLrOvI0kxfkSZ00VbOIXlKZcsyCYK9s+HEQuBXMiL4D8mmF5qvOnqBRpwtSg0Kkxs2kIPgEVL8kRTA9YVhIqf4bCaucPBfbVt44VFgWVP9darcp0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(366004)(136003)(376002)(39850400004)(451199018)(38100700002)(6512007)(26005)(558084003)(31696002)(36756003)(86362001)(31686004)(186003)(2616005)(6506007)(53546011)(41300700001)(66946007)(66476007)(8936002)(8676002)(66556008)(6666004)(478600001)(2906002)(110136005)(6486002)(316002)(44832011)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?53dodzhJU+IVk2CyRAvRKFAO0NsWlM9cj6FQIh0QO8fgyTzmxdt13p5zMcoS?=
 =?us-ascii?Q?u3w6CX7kE309wzYGyZp5yQ2iIEN7yS90in5Uw5F0iuOPT+jQi0/k5h4h6jqz?=
 =?us-ascii?Q?7oA8CwTPQwiJ93MBOFk0zXAqqqw9VZ/OTm+O3J75b4qrF8fvwqUaAP7GEAAZ?=
 =?us-ascii?Q?sFxpnPHhLTIfUMkIfyWiSKs9epPJQIBWxasbna8kqTA0+RboxRkxIPjRFOtP?=
 =?us-ascii?Q?Cn5GAzFFS1Ee7UtKT5hTKJP+Ic7ZdYj5rmUTSj96/G5jqwfgHHi7fSLQPsq+?=
 =?us-ascii?Q?ln5RIV0yB+6pGyqbflKPC93uBfKORQGWE2idqHdrCHbWZ049iKQFhTjEC/oh?=
 =?us-ascii?Q?dSqBCCsBp40kRehaCKjUMypIQNUc7fg0KpqIQ5OHhEs1uogcLV0NJgl5Kujs?=
 =?us-ascii?Q?hY0buvSqWXn07k2rBDOvpT/EHcbDupm5i2XPnXuZY31ZkfE5BLMqWzsL3qA+?=
 =?us-ascii?Q?FX614iSkl18uwXJK+TwU38v/vis/+Fat7LWRGxBS2Q7LpPLa+vLucTZ/FknG?=
 =?us-ascii?Q?npKuaBTCM17/yHroaUP6i8Bt1/jd484w5hadsiY9jNzrhWafD2Rvk6V7nwhw?=
 =?us-ascii?Q?1sFGjqm/q6FaWWWR/EVUxeitT647PNWs8shl+uo8+Kn1OsGmekdrXGMzvvNZ?=
 =?us-ascii?Q?wdqK7xPn1Uhlc3Xr2brLhEPEqtXx3cl2lmKOeUXUV6sbme090Naqk1a5lGjV?=
 =?us-ascii?Q?zTXXYTp57kl77KyDr7i1FTULRPcZXirsBiMe94FoZzgXVyrFcu+jzwBt3WoO?=
 =?us-ascii?Q?H9EwZRYQj7o/uq0vIr02MQTYwQKnYCggICaJGeK7fNOnOS3kMexJ/GtV4QjX?=
 =?us-ascii?Q?yaUmPlgI3ENrBSvG0B0Gyv5cw/wV4OGqYzjQpeYKJJcgxVgzLoDLOM6XSAle?=
 =?us-ascii?Q?omtniGaB+X873iP6UNkoY9v3ut3P9cO6s6Lp5FCYp1Aed02SfVpL3MrWGR7j?=
 =?us-ascii?Q?SM9/YGgXF4lzKr3GKMjdxGF3r0TUiTvkduT7btMVgT5EzxaLpyXl84rbaI6n?=
 =?us-ascii?Q?yM9sNVCLiUJjIUQV4p3E0sff9mf4kQUZeyO0kQ7BtaZ1gaS7b5sMPKXoaoGc?=
 =?us-ascii?Q?EOICUOa60ojm8buKHEl2rvZ3C2JJCyHwnFLhYBbKPAyr5JpdWeCdXClNkMah?=
 =?us-ascii?Q?RKE57IrBArL73Gb8QbuWQQLAKXqANU6U06icJXN7yJoBX52ij90xDT6HqB80?=
 =?us-ascii?Q?nErIfCPvuOmqLzigKHW630/D4xezL7QSyenjgc3BA/lYN+zkm2xDqN8oR9lU?=
 =?us-ascii?Q?NS/E/dc0CPodGMc4RbogWqPrqAjHQcQDwIJCgrjCKQobZRFy0m06EHAm6XBl?=
 =?us-ascii?Q?1yLOPPgV2q5aaRzlYGNk38auNDxGVJZSxjC+BhC+7kYX9BW1Z3nxZJfywDMd?=
 =?us-ascii?Q?v7hrNGcL+QwqAoMoXZDOkTN1mJD5TI2j6R64bftUAC8cFEdprD5qN4EGZDWp?=
 =?us-ascii?Q?QXLQW+zuXKbfoXvcmT5xIMUVkAC+gOCnlbscIHnQcPcDb4gBNUDrnlEOBwIe?=
 =?us-ascii?Q?oB9TqnqS+BxbzZTXETXKQvbrrVb7sLDaO/ltwhd8hxNz00yKRNrBMcPOPKSu?=
 =?us-ascii?Q?u3sj0fPNsEsE+7Q8IeyCctyFykEsmzJ4uYsZWj7Yi4y/4uw/s7pK7i+LGpj1?=
 =?us-ascii?Q?VMIDqBdci397DEZyqwgkDQo=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f83c5573-f2a8-4662-5520-08db0910105b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 13:34:40.3635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wupzRjt3zF255cwHM+ZFpI3CzPNAn89Ce8kUZ6iXP9tS/iZ7b/8dXe/44LD1WIg0UKkJ/hN/QMZ2+egdrvRJrU01OOm0CLw6BS3mDfa8aXiAptyIbeBOkCFUBsElteHh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8822
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 07 Feb 2023 13:34:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3641

Hi Ulrich,

On 2/7/23 13:19, Ulrich =C3=96lmann wrote:
> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Michael, please backport to kirkstone too.

Thanks,
Quentin

