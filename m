Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76368C19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 13:11:53 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.51])
 by mx.groups.io with SMTP id smtpd.web10.8230.1659532302560840199
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Aug 2022 06:11:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=NaoZ/XKl;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.51,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kt4frTL7nSeGrAo1fxOLY3BCjQqYVs4VJi5uOFjIggM7jqFDfjGM3s2GdZEPWksgO2PSRsr/tHJe6Ll8gl16BPu4Hhr4LQN1YNsXKFpmrDZVb8iM/gyUdNxj2NynFCIuTc+EKEwn5Ua0O4u/br2AvvICnA8YOny+kho2S2by8XNaK9/leEqmtnODfsIhUAtvt5uM5n+Eem0Uhu8rzAKqwwb2RS9QGTXKPxgP4RXg9EMH/CaA4RnkIWRaxgK72jFC8edl5OXGrJq/Mvl0IdKM7vY6d4QV6XidLpdqeJpd9TwBGUe98xHItGC7opBiMdb6LF628X7OB4/LELZohz3z3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWSePRrAFVE+UDew6YToxX4CBN++OcY4cx4+fsLzaH0=;
 b=GW0vxtTKJcRMNgpBNEnlybMjB2FxstHFS9kHmtavIrut/mUgT54hFE1Z4rDpCFYv6A7PvZdmYJoH3zxbzObE0BZv4azD1DUaXP7jP0w6dLdV95eB0A03MUV/5qf4u7ZPqNGlvVQ4ynMfA37ysiDBbiZwWPv66RYMWUmwB1jRCh5eayrL/5xKhAnLkAf6IFaH7OrKLXljcCiGOmRVStuDb30ujexM7lPLH3wySMbqvu+cqTFN+DZoq3az8DYDr3uFWon5vJTS2kmhEhZkIekpZidIWgRPugaur/H66JqvYLZgAFQfkkOxv/O88GScDYQR0/FGUcr1et2TejZsLiXi1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWSePRrAFVE+UDew6YToxX4CBN++OcY4cx4+fsLzaH0=;
 b=NaoZ/XKlCTjJTzIcsrMd4g5RRn2x+qCGIYiw9LvQr0fgDuXHaK1YIXNZYBVd0pRcp10TKgnAOwIRLjXU1rYAKEyvNUOgfi0gboqh3pNfI8QiTTPuYtfZv1Ev2R/UVxTUeCp8c/IIq2wCRfWBfYMFgRUWLOJWD71EFbohekW5080=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DB8PR04MB6409.eurprd04.prod.outlook.com (2603:10a6:10:103::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 13:11:38 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e%3]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 13:11:37 +0000
Message-ID: <eb55af01-e73f-856d-e61b-3eb331504da9@theobroma-systems.com>
Date: Wed, 3 Aug 2022 15:11:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [docs] Generated master docs not up to date - issue in
 run-docs-build?
Content-Language: en-US
To: michael.opdenacker@bootlin.com,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <ac5fc19e-3c47-edb2-b5f0-da408275c0f6@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <ac5fc19e-3c47-edb2-b5f0-da408275c0f6@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::22) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09469421-eadb-4717-a293-08da7551b2a3
X-MS-TrafficTypeDiagnostic: DB8PR04MB6409:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	glKZxbkVKHAE7c0fY5Yj8mbPpzeLhFPfuRJpUXBcJnYvWh5GpTydj+fO92bUC/N8Wya0eeFa6kJncinpQIrIkjkktgQFj/ckuEd8x3L7N2tLvcabhUVRMF5q5W5ehmRpxrwGzn6sMYiXUsmJ6BPkjbEzE0aCg55h9kUT8DJRhlsHhMp1gKn+7Y+4ExqE0aSfeuCFJegIxv6K9imrKtWJ7Q9WYS5jHRWXQoMx72lNj1xQy0ntSYpjWBjl/LzTWG7qYiu1qkOldsTulwM9ZfgpO51nGvmtWjCUhofJnwBP7X+O+Xo72FYLIgrvAlYt00wjxtHvkyxLZFT685cQC3LUcVw/O/HKvuFW/c2dEvfnjuRGGg0ZKdwKgTfKUj+R2C3ro6KkYvU3tEAeHlBT/MNxjSYiPQ7qv1tQUU4ow8u/tDOEr/9EveV1B53ftNZVsnPMGmGsEgSSW5GPhdUmU81M158hr8TfPhrHSwPE849GF45c2ZJPTADemG7JViNb3jqWYE4O1q6NgiJSJS6e4TvDBfX+g77uNSikiiZSwVH2/6O3LwCCKYOClAIEk4fpiZJXs/vC/DifABc/gat6qLUArq6TO9u8US0nyJTdy3ca1yXf+F1CVH3bpSmC6RQ7OHRDjuaTwrmttnt7zpOWnmwfDRXJ/Y/s/Lou1gtP3M1HxIufSogVJyiNuDlRR3E5hys3yRtApVJr7BXurcHhkC57JhKTxhuAlvTE6NQdbXFxrWV4vDJIqT+5iuC513AsADyB876809J3zw5LeD4mMyavyvECIz0nGBelNbVgynNW4FlsYUSWNZSRfPaOUbdCA4tacVCT7WauBgsosgBE5qD3xJF0C8yfGyC0oovIBaAlG94=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(39850400004)(366004)(396003)(346002)(186003)(2616005)(86362001)(41300700001)(26005)(6506007)(6512007)(53546011)(36756003)(316002)(83380400001)(6916009)(45080400002)(66476007)(66556008)(66946007)(2906002)(44832011)(8676002)(31696002)(5660300002)(478600001)(966005)(6486002)(8936002)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xywxxFltOS1lM9d0IibxEmxYsaPjWRQIsM4XvIe5jlpIAlQAXWd96xkZNIw5?=
 =?us-ascii?Q?LVCwubG/oX+r/H+G22GoiGmDGki0zCvnlKJ3CD9g3DDEl4xZHjHI2XjZBSiI?=
 =?us-ascii?Q?er9BgbRDglrh+XWAGig3/xc2xQyIKjil+IZdw3/qqi7A+cHwm+lElXnmHS9D?=
 =?us-ascii?Q?B7AVdSuWwvsCPf/ZQU0rc2koUrn3HdSO+GgbC5xdYR/SQepktyyfuX/ApdDJ?=
 =?us-ascii?Q?Phv4kkVVobrdO5iXRnl238SPgBZ9X0eyoIJ+GJ0AxWq4kCMnH0rxJY+hPKmL?=
 =?us-ascii?Q?D0oLeDfBZqqCd7iNpYV+ZZCBNMzdxBUtfRTLJ9CVNvKR2RKAPIg86rJYt/NC?=
 =?us-ascii?Q?DKcT13/iLYfBcDFlpp621TTBO+wfqsC4aNJMGVo8fnLO2MltHFKSv0oHrujg?=
 =?us-ascii?Q?QdBKMfia1m40OkzwuqpmSvK7HlNkbmxnWQrhBouSS8sBBXbw7vfdE0EhJCUv?=
 =?us-ascii?Q?1AVzAxHNTQ8L0v8wlo51a8SIR0tGN9k7kkQd78mljZF5+Bo5QK1Y4erHu2P5?=
 =?us-ascii?Q?+A/nkrns5WO99dOsHXEr19DN682bIA9BTDcRJ15ovG7we0WBPBzEisLVlvp2?=
 =?us-ascii?Q?QCja806sRgWiEoyBGE6NCzul1eck5i5w6JF8HLBLLO7exFBtfL/tc1HNjj49?=
 =?us-ascii?Q?8fUzhR1dMQSJnTFdc+1F+DNpTgorCkGuNl5vKVMtw92v6dnHP5um7uOrExaV?=
 =?us-ascii?Q?fhw+RxQXZZ4MBX1aGHkznQAQp2JESOpGMATD8lI55qoLRLp57gNhG8jAtCCW?=
 =?us-ascii?Q?uzg68Uh/n7Z6A0aTx5+E6z24JM5x0x/kTiACaeeXtoSQmrK5ds7ZMWyBF3rq?=
 =?us-ascii?Q?41v1X1zOLb6nEdF99ll88rbu4TPecnVZWnoUO7Xk1MBmCAnsURREju+3ZzCA?=
 =?us-ascii?Q?W9bcyp9U5FUGaNHN7L3NSHMWj0tqAme7FUteRLCq5g1rODKNo+CQN1VaBPes?=
 =?us-ascii?Q?fTzOfbEHNxH917ykliRQZKlT1qZq5nmAz0n8CIDBJFCoDesqGK9mIRmQPRFW?=
 =?us-ascii?Q?MUa+tJ7xq+nvV+ZMx29Nha8yNTUQlQLwGq/SwtONnlc4IEtvNEOwFpkRKYsy?=
 =?us-ascii?Q?bh3ComNCuGr+KGLUMgC9KxZOnvlSvx7HeuYZvTSatxnxuUIcCBQgWIN0UDPM?=
 =?us-ascii?Q?X9E+lP6opI1qDaddCCU5X0iFp3xSbbfUhTnHvj1PXbeN1l4ZZBWYMtu8Kt/9?=
 =?us-ascii?Q?DoEDVYJV023Cf9wzOYQ1b6QWn+9Io17J9/5xejSo5NS87Bsbdze57z/Dtz/5?=
 =?us-ascii?Q?GGmbtOixKm5UkzebyJ84373+avG01EqGubeBPjjB0lf2GX0v7YMLBEcfs6PT?=
 =?us-ascii?Q?FUZXmp3sLn2axjhpufB7nF5vTGoe5q73GjSeniYM1anUKMKC9DLSgDBfGEns?=
 =?us-ascii?Q?IIJmWtPKBrtp2GlMYGK4Fxe97dSpLSRlK+XEUmdbFCWje7ugS4tRT6P6ukwP?=
 =?us-ascii?Q?jlcLWxwTa3RxHuSDbDezrvWn/++I/6fpBpTjgTeCQiDbeucgivHtqilcES9z?=
 =?us-ascii?Q?E7dzNey7W94T2MBEcKH8FBPcP5uhbfya8H0QTXUc5Y3Z8DTKLvauElY0hlkO?=
 =?us-ascii?Q?pmHsItE/oPo8sX1lIHTqIdyQCIF3biRicVb1RG+JkUdPgTHfvQjGR3IjYZBW?=
 =?us-ascii?Q?bQv/AtnyvIDvkhZzzKKK6Gc=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 09469421-eadb-4717-a293-08da7551b2a3
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 13:11:37.7309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 H3a5WDv641xj9gJwzc+mC/rank6bg/5fQapZi4VrrMuatm9CZXxh1Evuw+43bgeYlXEwzQ5mly9MNTw0KdYpFEX+EtIL5pIZbAKaVtmWURtgMlNQspb0sItl9XY9MmAd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6409
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Aug 2022 13:11:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3104

Hi Michael,

Sorry for Office365 mangling the URLs, I wish it wasn't on........

On 8/3/22 14:59, Michael Opdenacker via lists.yoctoproject.org wrote:
> Greetings
>=20
> I've found issues with=20
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__docs.yoctoproject.=
org_&d=3DDwICaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTS=
qHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DomMbxGmNQJRezZOXvOUrTA_kKPNZV4A2oV=
crJjd86fPT8aVHAs52Av4OvW3-7lse&s=3DpFIoanEyazz3qTtKZ31so443Fv7Vpfnj5fZnx3H1=
4oQ&e=3D=20
> , generated from the master branch:
>=20
>  =C2=A0* The 4.0.1 and 4.0.2 release notes don't appear on
>    =20
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__docs.yoctoproject.=
org_migration-2Dguides_index.html&d=3DDwICaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=
=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DomM=
bxGmNQJRezZOXvOUrTA_kKPNZV4A2oVcrJjd86fPT8aVHAs52Av4OvW3-7lse&s=3D8l5ZSIFCB=
5w2dI1Hi2WadpcRCQLbdi5_SgEaJQ9b9bw&e=3D =20
> while they
>  =C2=A0=C2=A0 are in the master branch
>    =20
> (https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.=
org_yocto-2Ddocs_commit_-3Fid-3D027a58616db9f3e8ee5992b57fd99cb3c284ece9&d=
=3DDwICaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8y=
BP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DomMbxGmNQJRezZOXvOUrTA_kKPNZV4A2oVcrJjd8=
6fPT8aVHAs52Av4OvW3-7lse&s=3DXhvjm3mSHW3Tv-1GKzIzVWMdX4ZsBOiGabMGhSbv_yc&e=
=3D=20
>  =C2=A0=C2=A0 and
>    =20
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_yocto-2Ddocs_commit_-3Fid-3Da17bfe2636c11ce8e3266d9add804d795991e2ea&d=
=3DDwICaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8y=
BP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DomMbxGmNQJRezZOXvOUrTA_kKPNZV4A2oVcrJjd8=
6fPT8aVHAs52Av4OvW3-7lse&s=3D5RhBg7FSba6PsHFejKTGnq-KXoYKhPHU1xAMwsTZ5zg&e=
=3D=20
> )

Because you're not looking at the master branch.
https://docs.yoctoproject.org/dev/migration-guides/index.html
has it.

>  =C2=A0* PEP517_BUILD_API is still documented on
>    =20
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__docs.yoctoproject.=
org_ref-2Dmanual_variables.html-23term-2DPEP517-5FBUILD-5FAPI&d=3DDwICaQ&c=
=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4nj=
ZguQhZhkI_-172IIy1t&m=3DomMbxGmNQJRezZOXvOUrTA_kKPNZV4A2oVcrJjd86fPT8aVHAs5=
2Av4OvW3-7lse&s=3DZ72HE5ahwiHuHzuO6dkA0rbQQKwHM5BdD7A5YzUzMJU&e=3D=20
>  =C2=A0=C2=A0 while it was removed by
>    =20
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_yocto-2Ddocs_commit_-3Fid-3Dafa895871e8ec18f4861f48f70b8a54cc2e4cb98&d=
=3DDwICaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8y=
BP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DomMbxGmNQJRezZOXvOUrTA_kKPNZV4A2oVcrJjd8=
6fPT8aVHAs52Av4OvW3-7lse&s=3D2DMYIlsNiG_tPJ9GRzF6XuEjTPbgP7CBO_TgZ8gmEgs&e=
=3D=20
>=20

Ditto.

> So, some commits in master doesn't seem to have been used for generating=
=20
> the docs. However, the latest commit=20
> (https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.=
org_yocto-2Ddocs_commit_-3Fid-3D5004957d1c65d03d3e296bc9f0a00982457a27f8&d=
=3DDwICaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8y=
BP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DomMbxGmNQJRezZOXvOUrTA_kKPNZV4A2oVcrJjd8=
6fPT8aVHAs52Av4OvW3-7lse&s=3DcSKVy0IkfnU5lIiP7ywCf-i6RsLkyjrUcROT160Dn8M&e=
=3D=20
> ) was used because you have the new hash server (hashserv.yocto.io:8687)=
=20

No, commit f9a9c5cc721a79df7a39a6df8441739e3377fdc4 is actually used,=20
because you're looking at the kirkstone branch and not master.

> on=20
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__docs.yoctoproject.=
org_brief-2Dyoctoprojectqs_index.html-23building-2Dyour-2Dimage&d=3DDwICaQ&=
c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4n=
jZguQhZhkI_-172IIy1t&m=3DomMbxGmNQJRezZOXvOUrTA_kKPNZV4A2oVcrJjd86fPT8aVHAs=
52Av4OvW3-7lse&s=3DZscUeWWce0XqCZw86gXHzGP7krugyL07NWNnhuWGIVQ&e=3D=20
>=20
> On the contrary,=20
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__docs.yoctoproject.=
org_next&d=3DDwICaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA=
1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DomMbxGmNQJRezZOXvOUrTA_kKPNZV4=
A2oVcrJjd86fPT8aVHAs52Av4OvW3-7lse&s=3D9dr7-M7-VQ2FVie76y_7895g8beuIJolI-Kx=
nYvDIMo&e=3D =20
> generated from the master-next branch looks OK as it contains the 3=20
> above changes, and the changes from the latest commit.
>=20
> Weird, isn't it? Could there be an issue in=20
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_yocto-2Dautobuilder-2Dhelper_tree_scripts_run-2Ddocs-2Dbuild&d=3DDwICaQ&=
c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4n=
jZguQhZhkI_-172IIy1t&m=3DomMbxGmNQJRezZOXvOUrTA_kKPNZV4A2oVcrJjd86fPT8aVHAs=
52Av4OvW3-7lse&s=3DdkIKElbngTDiX6Iryp8iUHSfLeLX6T9R6-HZNv5SEL8&e=3D=20
> , the scripts which generates our docs?
>=20

Nope, expected.

> I started looking at the Autobuilder logs=20
> (https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__autobuilder.yocto=
project.org_typhoon_-23_builders_114&d=3DDwICaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&=
r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3Dom=
MbxGmNQJRezZOXvOUrTA_kKPNZV4A2oVcrJjd86fPT8aVHAs52Av4OvW3-7lse&s=3DO9gSB3rF=
AHS_gj5OGIzBEXjBpU5FLQjSjoCaO_PCbr4&e=3D=20
> ), but haven't found anything suspicious yet. Investigations may take=20
> time though.
>=20

You won't find anything :)

So.. we decided some months ago to make the "default" branch of the docs=20
on docs.yoctoproject.org point to the latest release to date instead of=20
the master branch because we believe most people will use the latest=20
release rather than the master branch and we don't want to misdocument=20
variables, features or behaviors for them.

If we should actually redirect the "default" branch to the latest=20
release branch from an HTTP point of view is a different topic. The idea=20
would have https://docs.yoctoproject.org/ redirect to=20
https://docs.yoctoproject.org/kirkstone until the next release and then=20
redirect to langdale. I am not sure this is going to make web search=20
engine SEO happy though...

Finally, you can see the branch of the documentation you're looking at=20
from the dropdown menu at the top of the page.

Cheers,
Quentin

